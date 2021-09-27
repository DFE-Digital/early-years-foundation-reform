class ContentPagesController < ApplicationController
  layout "cms"

  before_action :authenticate_user!
  before_action :set_content_page, only: %i[show edit update destroy versions]

  # GET /content_pages
  def index
    @content_pages = ContentPage.top_level.order_by_position
  end

  # GET /content_pages/1
  def show; end

  # GET /content_pages/new
  def new
    # If the new page is a child, pass through its parent id
    # Pages with a nil parent_id are top_level
    next_position = ContentPage.maximum("position") ? (ContentPage.maximum("position") + 1) : 1
    @content_page = ContentPage.new(parent_id: params[:parent_id], position: next_position)
  end

  # GET /content_pages/1/edit
  def edit
    @md = GovspeakToHTML.new.translate_markdown(@content_page.markdown)
    @content_page
  end

  # POST /content_pages
  def create
    @content_page = ContentPage.new(content_page_params)
    @content_page.author = current_user.name
    @content_page.is_published = false

    begin
      authorize @content_page, :create?

      if @content_page.save
        redirect_to "#{content_page_path(@content_page)}/versions", notice: "A new version was successfully created"
      else
        render :new
      end
    rescue Pundit::NotAuthorizedError
      @content_page.errors.add(:base, "You don't have permission to create pages")
      render :new
    end
  end

  # PATCH/PUT /content_pages/1
  def update
    authorize @content_page, :update?

    # If the position has changed, honour it. Versions do not have positions
    if content_page_params[:position] != @content_page.position
      @content_page.position = content_page_params[:position]
      @content_page.save!
    end

    if @content_page.valid?
      ContentPageVersion.create!(title: @content_page.title,
                                 markdown: content_page_params[:markdown],
                                 content_page_id: @content_page.id,
                                 author: current_user.name)
      redirect_to "#{content_page_path(@content_page)}/versions", notice: "A new version was successfully created"
    else
      render :edit
    end
  rescue Pundit::NotAuthorizedError
    @content_page.errors.add(:base, "You don't have permission to change pages")
    render :edit
  end

  # DELETE /content_pages/1
  def destroy
    authorize @content_page, :destroy?
    @content_page.destroy!
    redirect_to content_pages_url, notice: "Content page was successfully destroyed."
  end

  # POST of preview, returns html
  def preview
    html = GovspeakToHTML.new.translate_markdown(params["markdown"])

    render json: { html: html }
  end

  def versions; end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_content_page
    @content_page = ContentPage.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def content_page_params
    params.require(:content_page).permit(:title, :markdown, :parent_id, :position)
  end
end
