module Admin
  class ArticlesController < AdminController
    before_action :set_article, only: %i[show edit update destroy]

    def index
      @articles = ContentPage.where(category: "article")
    end

    def show; end

    def new
      @article = ContentPage.new(category: "article")
    end

    def create
      @article = ContentPage.new(article_params)
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
      @article = ContentPage.find(params[:id])
    end

    def article_params
      # category set to article in form
      # position set to 9999 in form
      params.require(:content_page).permit(:title, :markdown, :category, :position)
    end
  end
end
