class ContentPageVersionsController < ApplicationController
  layout "cms"

  before_action :authenticate_user!
  before_action :set_content_page_version, only: %i[destroy edit update]

  def destroy
    # authorize @content_page, :destroy?
    @parent_page = @content_page_version.content_page

    @content_page_version.destroy!
    redirect_to "#{content_page_path(@parent_page)}/versions", notice: "Content page version was successfully destroyed."
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
