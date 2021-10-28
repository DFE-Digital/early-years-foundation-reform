class ArticlesController < ApplicationController
  def index
    @articles = Article.all.limit(8)
    respond_to do |format|
      format.html { render "index", layout: "articles_landing_page_layout" }
    end
  end

  def show
    @article = Article.friendly.find(params[:id])
    respond_to do |format|
      format.html { render "show", layout: "article_pages" }
    end
  end
end