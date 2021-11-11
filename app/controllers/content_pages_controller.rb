class ContentPagesController < ApplicationController
  layout "cms"

  before_action :authenticate_user!
  before_action :set_content_page, only: %i[show edit update destroy versions unpublish]

  # GET /content_pages
  def index
    @content_pages = ContentPage.top_level.order_by_position
  end

  # GET /content_pages/1
  def show
    unless @content_page.is_published
      redirect_to 404
    end
  end

  # GET /content_pages/new
  def new
    # If the new page is a child, pass through its parent id
    # Pages with a nil parent_id are top_level
    next_position = ContentPage.maximum("position") ? (ContentPage.maximum("position") + 1) : 1
    @content_page = ContentPage.new(parent_id: params[:parent_id], position: next_position)
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

  # GET /content_pages/1/edit
  def edit; end

  # PATCH/PUT /content_pages/1
  # ContentPage markdown is never directly updated.  Changes happen to markdown
  # as ContentPageVersions are created, edited and published
  # Changes to position are applied directly to the published page, position has
  # no meaning for drafts
  # This update method does not do things the normal Rails way
  def update
    authorize @content_page, :update?

    # If the position has changed, honour it. Versions do not have positions
    if content_page_params[:position] != @content_page.position
      @content_page.position = content_page_params[:position]
      if @content_page.valid?
        @content_page.save!
      end
    end

    # This will not be saved, just doing it to take advantage of
    # ContentPage validation, before the same values are used to
    # create the ContentPageVersion
    @content_page.markdown = content_page_params[:markdown]
    if content_page_params[:title]
      @content_page.title = content_page_params[:title]
    end

    if @content_page.valid?
      ContentPageVersion.create!(title: @content_page.title,
                                 markdown: content_page_params[:markdown],
                                 author: current_user.name,
                                 content_page: @content_page)
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
    html = GovspeakDecorator.translate_markdown(params["markdown"])

    render json: { html: html }
  end

  def versions; end

  def unpublish
    authorize @content_page, :unpublish?

    @content_page.update!(is_published: false)
    ContentPageVersion.create!(title: @content_page.title,
                               markdown: @content_page.markdown,
                               author: current_user.name,
                               content_page: @content_page)

    redirect_to versions_content_page_path(@content_page), notice: t(".notice")
  end

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
