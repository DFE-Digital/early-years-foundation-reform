class ContentPageVersionsController < ApplicationController
  layout "cms"

  before_action :authenticate_user!
  before_action :set_content_page_version, only: %i[destroy edit update preview_of_draft publish]

  def destroy
    authorize @content_page_version, :destroy?
    authorize @content_page_version.content_page, :destroy?
    @parent_page = @content_page_version.content_page

    @content_page_version.destroy!

    # Odd requirement. This is a round about way to delete a page, by un-publishing it
    # and deleting all its versions. Normally pages can not be deleted, just un-published
    if @parent_page.content_page_versions.count.zero?
      @parent_page.destroy!
    end

    redirect_to content_pages_path, notice: "Content page version was successfully destroyed."
  end

  # GET /content_page_version/1/edit
  def edit
    @md = GovspeakToHTML.new.translate_markdown(@content_page_version.markdown)
    @content_page_version
  end

  def update
    authorize @content_page_version, :update?
    @content_page_version.author = current_user.name

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
    @page = @content_page_version.content_page
    if @page.is_published
      ContentPageVersion.create!(title: @page.title,
                                 markdown: @page.markdown,
                                 content_page_id: @page.id,
                                 author: current_user.name)
      # Copy the markdown and title into the ContentPage
      @page.update!(markdown: @content_page_version.markdown,
                    author: current_user.name)
    else
      @page.update!(markdown: @content_page_version.markdown, is_published: true, author: current_user.name)
      # Delete the version that this page was published from
      @content_page_version.destroy!
    end
    redirect_to versions_content_page_path(@page), notice: "Published"
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
