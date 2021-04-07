class GovspeakToHTML
  ALLOWED_TAGS = %w[details summary p h1 h2 h3 h4 ul li img div ol a span strong iframe].freeze

  def translate_markdown(markdown)
    newdoc = GovspeakDecorator.new(doc(markdown))
    newdoc.to_html
  end

  def doc(markdown)
    Govspeak::Document.new(markdown, sanitize: true, allowed_elements: ALLOWED_TAGS)
  end
end
