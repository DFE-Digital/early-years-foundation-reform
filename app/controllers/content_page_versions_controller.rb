class ContentPageVersionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_content_page_version, only: %i[destroy]

  def destroy
    # authorize @content_page, :destroy?
    @parent_page = @content_page_version.content_page

    @content_page_version.destroy!
    redirect_to "#{content_page_path(@parent_page)}/versions", notice: "Content page version was successfully destroyed."
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
