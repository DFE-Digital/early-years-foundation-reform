# https://github.com/vmg/redcarpet

class CustomPreprocessor < GovukMarkdown::Preprocessor
  # @return [CustomPreprocessor]
  def apply_all
    inject_inset_text.inject_details.download.two_thirds.image_card.button.external.quote.blockquote.video
  end

  # @example
  #   {download}
  #   A healthy balanced diet for children
  #   605 KB
  #   //assets.ctfassets.net/xxx.pdf
  #   //images.ctfassets.net/xxx.png
  #   2 pages
  #   {/download}
  #
  # @return [CustomPreprocessor]
  def download
    pattern = build_regexp('download')
    @output = output.gsub(pattern) do
      file_title, file_size, pdf_url, thumb_url, page_count = *Regexp.last_match(1).strip.split("\n")
      download_template.render(nil,
                               file_title: file_title,
                               file_size: file_size,
                               pdf_url: pdf_url,
                               thumb_url: thumb_url,
                               page_count: page_count)
    end
    self
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
  #   {image_card}
  #   This is the title
  #   This is the body copy
  #   //path/to/image
  #   {/image_card}
  #
  # @return [CustomPreprocessor]
  def image_card
    pattern = build_regexp('image_card')
    @output = output.gsub(pattern) do
      title, text, image = *Regexp.last_match(1).strip.split("\n")
      image_card_template.render(nil, title: title, text: text, image: image)
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
  # @return [CustomPreprocessor] CDT style
  def quote
    pattern = build_regexp('quote')
    @output = output.gsub(pattern) do
      quote, citation = split_content Regexp.last_match(1)
      quote_template.render(nil, quote: nested_markdown(quote), citation: citation)
    end
    self
  end

  # @example
  #   {blockquote}
  #   This is the quote and the citation
  #   {/blockquote}
  #
  # @return [CustomPreprocessor] Govspeak style
  def blockquote
    pattern = build_regexp('blockquote')
    @output = output.gsub(pattern) do
      quote, citation = split_content Regexp.last_match(1)
      blockquote_template.render(nil, quote: nested_markdown(quote), citation: citation)
    end
    self
  end

  # @example
  #   {video}
  #   video
  #   This is a video title
  #   This is the video provider (YouTube or Vimeo)
  #   {/video}
  #
  # @return [CustomPreprocessor]
  def video
    pattern = build_regexp('video')
    @output = output.gsub(pattern) do
      params = { enablejsapi: 1, origin: ENV['DOMAIN'] }.to_param
      video_id, video_title, video_provider = Regexp.last_match(1).strip.split("\n")
      video_site_url = !video_provider.nil? ? video_provider_url(video_provider) : 'https://www.youtube.com/embed'
      video_url = %(#{video_site_url}/#{video_id}?#{params})

      video_template.render(nil, url: video_url, video_title: video_title)
    end
    self
  end

private

  # @return [String]
  def video_provider_url(video_provider)
    if video_provider.casecmp?('vimeo')
      'https://player.vimeo.com/video'
    else
      'https://www.youtube.com/embed'
    end
  end

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
  def download_template
    @download_template ||= Slim::Template.new('app/views/markup/_downloadable_media.html.slim')
  end

  # @return [Slim::Template]
  def image_card_template
    @image_card_template ||= Slim::Template.new('app/views/markup/_image_card.html.slim')
  end

  # @return [Slim::Template]
  def two_thirds_template
    @two_thirds_template ||= Slim::Template.new('app/views/markup/_two_thirds.html.slim')
  end

  # @return [Slim::Template]
  def quote_template
    @quote_template ||= Slim::Template.new('app/views/markup/_quote.html.slim')
  end

  # @return [Slim::Template]
  def blockquote_template
    @blockquote_template ||= Slim::Template.new('app/views/markup/_blockquote.html.slim')
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
