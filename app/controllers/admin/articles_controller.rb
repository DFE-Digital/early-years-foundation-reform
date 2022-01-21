module Admin
  class ArticlesController < AdminController
    before_action :set_article, only: %i[show edit update destroy publish unpublish]

    def index
      @articles = if params[:sort].nil?
                    Article.order(description: :asc)
                  else
                    Article.order(params[:sort])
                  end
    end

    def show; end

    def new
      @article = Article.new
    end

    def create
      @article = Article.new(article_params.merge(created_at: Time.zone.now.utc))
      if @article.save
        redirect_to admin_articles_path(anchor: "draft"), notice: t(".notice")
      else
        render :new
      end
    end

    def edit; end

    def update
      if @article.update(article_params)
        redirect_to admin_article_path(@article), notice: t(".notice")
      else
        render :edit
      end
    end

    def destroy
      @article.destroy!
      redirect_to admin_articles_path, notice: t(".notice")
    end

    def publish
      authorize @article

      @article.published!
      @article.touch(:published_at)
      redirect_to admin_articles_path(anchor: "published"), notice: t(".notice")
    end

    def unpublish
      @article.unpublished!
      @article.touch(:unpublished_at)
      redirect_to admin_articles_path(anchor: "unpublished"), notice: t(".notice")
    end

  private

    def set_article
      @article = Article.friendly.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :markdown, :description, :featured_image, :thumbnail_image, :featured_alt_text, :thumbnail_alt_text).merge(author: current_user.name)
    end
  end
end
