class ContentController < ApplicationController
  layout 'content'

  # GET /content/page_title
  def show
    @page = ContentPage.find_by_slug params['slug']

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    @markdown = markdown.render(@page.markdown)

    @page
  end
end
