module Admin
  class ArticlesController < AdminController
    before_action :set_article, only: %i[show edit update destroy]

    def index
      @articles = Article.where(category: 'article')
    end

    def show; end

    def new
      @article = Article.new
    end

    def create
      @article = Article.new(article_params)
      if @article.save
        redirect_to admin_article_path(@article), notice: "Article was successfully created"
      else
        render :new
      end
    end

    def edit; end

    def update
      if @article.update(article_params)
        redirect_to admin_article_path(@article), notice: "Article was successfully updated"
      else
        render :edit
      end
    end

    def destroy
      @article.destroy!
      redirect_to admin_articles_path, notice: "Article was successfully destroyed"
    end

  private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      # category set to article in form
      params.require(:article).permit(:title, :markdown, :category)
    end
  end
end
