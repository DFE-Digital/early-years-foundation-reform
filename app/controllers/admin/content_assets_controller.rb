module Admin
  class ContentAssetsController < AdminController
    before_action :set_content_asset, only: %i[show edit update destroy]

    # GET /content_assets
    def index
      @content_assets = ContentAsset.all
    end

    # GET /content_assets/1
    def show; end

    # GET /content_assets/new
    def new
      @content_asset = ContentAsset.new
    end

    # GET /content_assets/1/edit
    def edit
      authorize @content_asset, :edit?
    end

    # POST /content_assets
    def create
      @content_asset = ContentAsset.new(content_asset_params)

      authorize @content_asset, :create?
      # Not sure about what to do here
      if upload_rate_limit_exceeded?
        redirect_to admin_content_assets_path, notice: "Only one upload is allowed in each 30 seconds, please wait..."
      elsif @content_asset.save
        redirect_to admin_content_asset_path(@content_asset), notice: "Content asset was successfully created."
      else
        render :new
      end
    end

    # PATCH/PUT /content_assets/1
    def update
      authorize @content_asset, :update?

      if @content_asset.update(content_asset_params)
        redirect_to admin_content_asset_path(@content_asset), notice: "Content asset was successfully updated."
      else
        render :edit
      end
    end

    # DELETE /content_assets/1
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
