class ArticlesController < ApplicationController
  def index
    @articles = Article.published.all.limit(8)
    respond_to do |format|
      format.html { render "index", layout: "articles_landing_page_layout" }
    end
  end

  def show
    @article = Article.published.friendly.find(params[:id])
    respond_to do |format|
      format.html { render "show", layout: "article_pages" }
    end
    # If page does not exist, deleted or unpublished
    not_found unless @article.published?
  rescue ActiveRecord::RecordNotFound
    not_found
  end
end
