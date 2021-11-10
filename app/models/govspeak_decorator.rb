class GovspeakDecorator < DelegateClass(Govspeak::Document)
  ALLOWED_TAGS = %w[details summary p h1 h2 h3 h4 ul li img div ol a span strong iframe].freeze
  j
  def self.translate_markdown(markdown)
    newdoc = new(Govspeak::Document.new(markdown, sanitize: true, allowed_elements: ALLOWED_TAGS))
    newdoc.to_html
  end

  Govspeak::Document.extension("YoutubeVideo", /\$YoutubeVideo(?:\[(.*?)\])?\((.*?)\)\$EndYoutubeVideo/m) do |title, youtube_link|
    youtube_id = youtube_link.scan(/^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|&v=)([^#&?]*).*/)[0][1]
    embed_url = %(https://www.youtube.com/embed/#{youtube_id}?enablejsapi=1&amp;origin=https://help-for-early-years-providers.education.gov.uk)
    optional_title = title ? %(title="#{title}") : ""
    %(<div class="govspeak-embed-container"><iframe class="govspeak-embed-video" src="#{embed_url}" #{optional_title} frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe></div>)
  end

  def to_html
    @to_html ||= begin
      html = if sanitize? # @options[:sanitize]
               raw_html = HtmlSanitizerDecorator.new(kramdown_doc.to_html)
               raw_html.sanitize(allowed_elements: allowed_elements)
             else
               kramdown_doc.to_html
             end
      Govspeak::PostProcessor.process(html, self)
    end
  end

  def sanitize?
    __getobj__.instance_variable_get(:@options)[:sanitize] == true
  end

  def kramdown_doc
    __getobj__.send("kramdown_doc")
  end

  def allowed_elements
    __getobj__.instance_variable_get(:@allowed_elements)
  end

  class HtmlSanitizerDecorator < Govspeak::HtmlSanitizer
    class YoutubeTransformer
      def call(sanitize_context)
        node      = sanitize_context[:node]
        node_name = sanitize_context[:node_name]

        # Don't continue if this node is already allowlisted or is not an element.
        return if sanitize_context[:is_allowlisted] || !node.element?

        # Don't continue unless the node is an iframe.
        return unless node_name == "iframe"

        # Verify that the video URL is actually a valid YouTube video URL.
        return unless node["src"] =~ %r{\A(?:https?:)?//(?:www\.)?((youtube)|(youtu\.be))(?:-nocookie)?\.com/}

        # We're now certain that this is a YouTube embed, but we still need to run
        # it through a special Sanitize step to ensure that no unwanted elements or
        # attributes that don't belong in a YouTube embed can sneak in.
        Sanitize.node!(node, {
          elements: %w[iframe],

          attributes: {
            "iframe" => %w[class allowfullscreen frameborder height src width title allow],
          },
        })

        # Now that we're sure that this is a valid YouTube embed and that there are
        # no unwanted elements or attributes hidden inside it, we can tell Sanitize
        # to allowlist the current node.
        { node_allowlist: [node] }
      end
    end

    def sanitize(allowed_elements: [])
      transformers = [TableCellTextAlignWhitelister.new, YoutubeTransformer.new]
      if @allowed_image_hosts && @allowed_image_hosts.any?
        transformers << ImageSourceWhitelister.new(@allowed_image_hosts)
      end

      Sanitize.clean(@dirty_html, Sanitize::Config.merge(sanitize_config(allowed_elements: allowed_elements), transformers: transformers))
    end
  end
end
