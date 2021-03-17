class GovspeakToHTML
  ALLOWED_TAGS = %w[details summary p h1 h2 h3 h4 ul li img div ol a span].freeze

  def translate_markdown(markdown)
    doc = Govspeak::Document.new(markdown, sanitize: true, allowed_elements: ALLOWED_TAGS)
    doc.to_html
  end
end
