class MarkdownToHtml
    def translate_markdown(markdown)
        doc = Govspeak::Document.new(markdown, sanitize: true, allowed_elements: ContentController::ALLOWED_TAGS)
    end
end
