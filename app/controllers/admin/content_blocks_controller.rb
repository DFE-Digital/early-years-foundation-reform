module Admin
  class ContentBlocksController < AdminController
    before_action :set_content_block, only: %i[edit update]

    # GET /content_blocks
    def index
      authorize User
      @content_blocks = ContentBlock.all
    end

    # GET /content_blocks/new
    def new
      @content_block = ContentBlock.new
    end

    # GET /content_blocks/1/edit
    def edit; end

    # POST /content_blocks
    def create
      @content_block = ContentBlock.new(content_block_params)
      begin
        authorize @content_block, :create?
        if @content_block.save
          redirect_to admin_content_blocks_path, notice: "Content block was successfully created."
        else
          render :new
        end
      rescue Pundit::NotAuthorizedError
        @content_block.errors.add(:base, "You don't have permission to create a new block")
        render :new
      end
    end

    # PATCH/PUT /content_blocks/1
    def update
      authorize @content_block, :update?
      if @content_block.update(content_block_params)
        redirect_to admin_content_blocks_path, notice: "Content block was successfully updated."
      else
        render :edit
      end
    rescue Pundit::NotAuthorizedError
      @content_block.errors.add(:base, "You don't have permission to edit blocks")
      render :edit
    end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_content_block
      @content_block = ContentBlock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def content_block_params
      params.require(:content_block).permit(:name, :description, :markdown)
    end
  end
end
