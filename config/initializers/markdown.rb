# https://github.com/vmg/redcarpet

class CustomPreprocessor < GovukMarkdown::Preprocessor
  # @return [CustomPreprocessor]
  def apply_all
    inject_inset_text.inject_details.two_thirds.button.external.quote.video
  end

  # @example
  #   {two_thirds}
  #   This is the body copy
  #
  #   ![right hand image](//path/to/image)
  #   {/two_thirds}
  #
  # @return [CustomPreprocessor]
  def two_thirds
    pattern = build_regexp('two_thirds')
    @output = output.gsub(pattern) do
      text, image = split_content Regexp.last_match(1)
      left_markup = nested_markdown(text)
      right_markup = nested_markdown("#{image}\n")

      two_thirds_template.render(nil, left: left_markup, right: right_markup)
    end
    self
  end

  # @example
  #   {button}[Continue](/path/to/page){/button}
  #
  # @return [CustomPreprocessor]
  def button
    pattern = build_regexp('button')
    @output = output.gsub(pattern) do
      text, link = hyperlink Regexp.last_match(1)

      <<~HTML
        <a href="#{link}" class="govuk-link govuk-button">
        #{text}
        </a>
      HTML
    end
    self
  end

  # @example
  #   {external}[Read more](https://example.com){/external}
  #
  # @return [CustomPreprocessor]
  def external
    pattern = build_regexp('external')
    @output = output.gsub(pattern) do
      text, link = hyperlink Regexp.last_match(1)

      <<~HTML
        <a href="#{link}" class="govuk-link" target="_blank" rel="noopener noreferrer">
        #{text} (opens in a new tab)
        </a>
      HTML
    end
    self
  end

  # @example
  #   {quote}
  #   This is the quote
  #
  #   This is the citation
  #   {/quote}
  #
  # @return [CustomPreprocessor]
  def quote
    pattern = build_regexp('quote')
    @output = output.gsub(pattern) do
      quote, citation = split_content Regexp.last_match(1)
      quote_template.render(nil, quote: nested_markdown(quote), citation: citation)
    end
    self
  end

  # @example
  #   {video}fsWEHuDpE8g{/video}
  #
  # @return [CustomPreprocessor] Embedded YouTube
  def video
    pattern = build_regexp('video')
    @output = output.gsub(pattern) do
      params = { enablejsapi: 1, origin: ENV['DOMAIN'] }.to_param
      video_url = "https://www.youtube.com/embed/#{Regexp.last_match(1)}?#{params}"
      video_template.render(nil, url: video_url)
    end
    self
  end

private

  # @param content [String]
  # @return [Array<String>]
  def split_content(content)
    content_end = content.split("\n").last
    content_start = content.gsub(content_end, '')
    [content_start, content_end]
  end

  # @param content [String]
  # @return [Array<String>]
  def hyperlink(content)
    content =~ %r{\[(.*)\]\((.*)\)}
    [Regexp.last_match(1), Regexp.last_match(2)]
  end

  # @return [Slim::Template]
  def quote_template
    @quote_template ||= Slim::Template.new('app/views/markup/_quote.html.slim')
  end

  # @return [Slim::Template]
  def video_template
    @video_template ||= Slim::Template.new('app/views/markup/_video.html.slim')
  end
end

class CustomRenderer < GovukMarkdown::Renderer
  include Redcarpet::Render::SmartyPants

  # @param document [String]
  # @return [String]
  def preprocess(document)
    CustomPreprocessor.new(document).apply_all.output
  end
end

module CustomMarkdown
  def self.render(markdown, **options)
    renderer = CustomRenderer.new(options, { with_toc_data: true, link_attributes: { class: 'govuk-link' } })
    Redcarpet::Markdown.new(renderer, tables: true, no_intra_emphasis: true).render(markdown).strip
  end
end
