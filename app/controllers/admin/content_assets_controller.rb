module Admin
  class ContentAssetsController < AdminController
    before_action :set_content_asset, only: %i[show edit update destroy]

    def index
      @content_assets = ContentAsset.all
      @content_pages = ContentPage.top_level.order_by_position
    end

    def show; end

    def new
      @content_asset = ContentAsset.new
    end

    def edit
      authorize @content_asset, :edit?
    end

    def create
      @content_asset = ContentAsset.new(content_asset_params)

      authorize @content_asset, :create?

      if upload_rate_limit_exceeded?
        redirect_to admin_content_assets_path, notice: "Only one upload is allowed in each 30 seconds, please wait..."
      elsif @content_asset.save
        redirect_to admin_content_asset_path(@content_asset), notice: "Content asset was successfully created."
      else
        render :new
      end
    end

    def update
      authorize @content_asset, :update?

      if @content_asset.update(content_asset_params)
        redirect_to admin_content_asset_path(@content_asset), notice: "Content asset was successfully updated."
      else
        render :edit
      end
    end

    def destroy
      authorize @content_asset, :destroy?

      @content_asset.destroy!
      redirect_to admin_content_assets_url, notice: "Content asset was successfully destroyed."
    end

  private

    def upload_rate_limit_exceeded?
      ContentAsset.where(updated_at: 30.seconds.ago..Time.zone.now).count.positive?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_content_asset
      @content_asset = ContentAsset.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def content_asset_params
      params.require(:content_asset).permit(:title, :asset_file, :alt_text)
    end
  end
end
