class ContentPageVersionsController < ApplicationController
  layout "cms"

  before_action :authenticate_user!
  before_action :set_content_page_version, only: %i[destroy edit update preview_of_draft publish]

  def destroy
    authorize @content_page_version, :destroy?
    authorize @content_page_version.content_page, :destroy?
    @parent_page = @content_page_version.content_page

    @content_page_version.destroy!

    # There is a requirement to delete the ContentPage if it is unpublished and if
    # the last of its ContentPageVersions have been removed
    if !@parent_page.is_published && @parent_page.content_page_versions.count.zero?
      @parent_page.destroy!
    end

    redirect_to content_pages_path, notice: "Content page version was successfully destroyed."
  end

  # GET /content_page_version/1/edit
  def edit; end

  def update
    authorize @content_page_version, :update?
    @content_page_version.author = current_user.name

    if @content_page_version.update(content_page_version_params)
      redirect_to versions_content_page_url(@content_page_version.content_page), notice: "This version was successfully updated"
    else
      render :edit
    end
  rescue Pundit::NotAuthorizedError
    @content_page_version.errors.add(:base, "You don't have permission to change versions of pages")
    render :edit
  end

  def preview_of_draft
    @page = ContentPage.new(title: @content_page_version.title,
                            markdown: @content_page_version.markdown,
                            position: 22,
                            previous_id: @content_page_version.content_page.id,
                            next_id: @content_page_version.content_page.id)

    render layout: "application"
  end

  def publish
    @page = @content_page_version.content_page
    @page.update!(markdown: @content_page_version.markdown, is_published: true, author: current_user.name, title: @content_page_version.title)

    # Delete the version that this page was published from
    @content_page_version.destroy!

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
