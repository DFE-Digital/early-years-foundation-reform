module Admin
  class ArticlesController < AdminController
    before_action :set_article, only: %i[show edit update destroy]

    def index
      @articles = Article.all.order(:title)
    end

    def show; end

    def new
      @article = Article.new
    end

    def create
      @article = Article.new(article_params)
      if @article.save
        redirect_to admin_article_path(@article), notice: t(".notice")
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

  private

    def set_article
      @article = Article.friendly.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :markdown, :description, :featured_image, :thumbnail_image, :featured_alt_text, :thumbnail_alt_text)
    end
  end
end
