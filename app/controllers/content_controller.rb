class ContentController < ApplicationController
  layout 'content'

  # GET /content/page_title
  def show;
    # a = request.original_url
    # TODO Find the ContentPage from the heading
    @page = ContentPage.first

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    @markdown = markdown.render(@page.markdown)

    @page
  end
end
