module Admin
  class ContentPageVersionsController < AdminController
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

      redirect_to admin_content_pages_path, notice: "Draft successfuly deleted"
    end

    def edit; end

    def update
      authorize @content_page_version, :update?
      @content_page_version.author = current_user.name

      if @content_page_version.update(content_page_version_params)
        redirect_to versions_admin_content_page_path(@content_page_version.content_page), notice: "This version was successfully updated"
      else
        render :edit
      end
    rescue Pundit::NotAuthorizedError
      @content_page_version.errors.add(:base, "You don't have permission to change versions of pages")
      render :edit
    end

    def preview_of_draft
      @page = ContentPage.new(title: @content_page_version.title,
                              intro: @content_page_version.intro,
                              markdown: @content_page_version.markdown,
                              content_list: @content_page_version.content_list,
                              position: 22,
                              description: @content_page_version.description,
                              previous_id: @content_page_version.content_page.id,
                              next_id: @content_page_version.content_page.id)

      render layout: "application"
    end

    def publish
      @page = @content_page_version.content_page
      @page.update!(
        markdown: @content_page_version.markdown,
        intro: @content_page_version.intro,
        content_list: @content_page_version.content_list,
        is_published: true,
        author: current_user.name,
        title: @content_page_version.title,
        description: @content_page_version.description,
      )

      # Delete the version that this page was published from
      @content_page_version.destroy!

      redirect_to versions_admin_content_page_path(@page), notice: "Published"
    end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_content_page_version
      @content_page_version = ContentPageVersion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def content_page_version_params
      params.require(:content_page_version).permit(:title, :intro, :markdown, :content_list, :author, :description)
    end
  end
end
