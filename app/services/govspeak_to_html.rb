class GovspeakToHTML
  ALLOWED_TAGS = %w[details summary p h1 h2 h3 h4 ul li img div ol a span strong iframe].freeze

  def translate_markdown(markdown)
    engine = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    engine.render(markdown)
  end
end
