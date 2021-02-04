class ContentAssetsController < ApplicationController
  before_action :authenticate_user!
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
  def edit; end

  # POST /content_assets
  def create
    @content_asset = ContentAsset.new(content_asset_params)

    if @content_asset.save
      redirect_to @content_asset, notice: "Content asset was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /content_assets/1
  def update
    if @content_asset.update(content_asset_params)
      redirect_to @content_asset, notice: "Content asset was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /content_assets/1
  def destroy
    @content_asset.destroy!
    redirect_to content_assets_url, notice: "Content asset was successfully destroyed."
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_content_asset
    @content_asset = ContentAsset.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def content_asset_params
    params.require(:content_asset).permit(:title, :asset_file, :alt_text)
  end
end
