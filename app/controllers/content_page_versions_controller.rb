class ContentPageVersionsController < ApplicationController
  layout "cms"

  before_action :authenticate_user!
  before_action :set_content_page_version, only: %i[destroy edit update preview_of_draft publish]

  def destroy
    authorize @content_page_version, :destroy?
    @parent_page = @content_page_version.content_page

    if @parent_page.content_page_versions.count == 1
      redirect_to "#{content_page_path(@parent_page)}/versions", notice: "Cannot delete the last remaining version"
    else
      @content_page_version.destroy!
      redirect_to "#{content_page_path(@parent_page)}/versions", notice: "Content page version was successfully destroyed."
    end
  end

  # GET /content_page_version/1/edit
  def edit
    @md = GovspeakToHTML.new.translate_markdown(@content_page_version.markdown)
    @content_page_version
  end

  def update
    authorize @content_page_version, :update?

    if @content_page_version.update(content_page_version_params)
      redirect_to versions_content_page_url(@content_page_version.content_page), notice: "This version was successfully updated"
    else
      render :edit
    end
  rescue Pundit::NotAuthorizedError
    @content_page.errors.add(:base, "You don't have permission to change versions of pages")
    render :edit
  end

  def preview_of_draft
    @page = ContentPage.new(title: @content_page_version.title,
                            markdown: @content_page_version.markdown,
                            position: 22,
                            previous_id: @content_page_version.content_page.id,
                            next_id: @content_page_version.content_page.id)

    @markdown = GovspeakToHTML.new.translate_markdown(@content_page_version.markdown)

    render layout: "application"
  end

  def publish
    # "content_page_id"=>"1", "id"=>"19"
    # If the page is already published, copy it to a new draft
    #
    # Copy the markdown and title into the ContentPage
    # Change the author
    @page = @content_page_version.content_page
    if @page.is_published
      ContentPageVersion.create!(title: @page.title,
                                 markdown: @page.markdown,
                                 content_page_id: @page.id,
                                 author: current_user.name)
      # Copy the markdown and title into the ContentPage
      @page.update!(markdown: @content_page_version.markdown)
    else
      @page.update!(markdown: @content_page_version.markdown, is_published: true)
    end
    redirect_to versions_content_page_path(@page) , notice: "Published !"
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_content_page_version
    @content_page_version = ContentPageVersion.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def content_page_version_params
    params.require(:content_page_version).permit(:title, :markdown, :author)
  end
end
