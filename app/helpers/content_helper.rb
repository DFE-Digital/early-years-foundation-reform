require 'ostruct'

module ContentHelper
  # @see [CustomMarkdown config/initializers/markdown.rb]
  # @param markdown [String]
  # @return [String]
  def m(markdown, headings_start_with: 'l')
    CustomMarkdown.render(
      markdown,
      headings_start_with: headings_start_with,
      filter_html: false,
    ).html_safe
  end

  def nav_list(page)
    if page.children?
      [page] + page.children
    else
      [page.parent] + page.parent.children
    end
  end

  def section_title(page)
    if page.children?
      page.title
    else
      page.parent.title
    end
  end

  def nav_title(page)
    if page.children?
      'Overview'
    else
      page.title
    end
  end

  def side_navigation(page)
    capture do
      content_tag(:ul, class: 'dfe-vertical-nav__section') do
        nav_list(page).map do |item|
          classes = if current_page?(item.path)
                      'dfe-vertical-nav__section-item dfe-vertical-nav__section-item--current'
                    else
                      'dfe-vertical-nav__section-item'
                    end
          concat(
            content_tag(:li, class: classes) do
              link_to nav_title(item), item.path, class: 'dfe-vertical-nav__link'
            end,
          )
        end
      end
    end
  end

  # @return [Resource, OpenStruct]
  def signup
    Resource.by_name('ctas.signup') || placeholder_resource('ctas.signup')
  end

  # @return [Resource, OpenStruct]
  def not_found
    Resource.by_name('error.not_found') || placeholder_resource('error.not_found')
  end

  # @return [Resource, OpenStruct]
  def internal_server_error
    Resource.by_name('error.internal_server_error') || placeholder_resource('error.internal_server_error')
  end

  # @return [Resource, OpenStruct]
  def unprocessable_content
    Resource.by_name('error.unprocessable_entity') || placeholder_resource('error.unprocessable_entity')
  end

  # @return [Resource, OpenStruct]
  def service_unavailable
    Resource.by_name('error.service_unavailable') || placeholder_resource('error.service_unavailable')
  end

  # @return [Resource, OpenStruct]
  def feedback
    Resource.by_name('ctas.feedback') || placeholder_resource('ctas.feedback')
  end

  # @return [Resource, OpenStruct]
  def content_footer
    Resource.by_name('ctas.content_footer') || placeholder_resource('ctas.content_footer')
  end

  # @return [Resource, OpenStruct]
  def other_useful_resources
    Resource.by_name('other_useful_resources') || placeholder_resource('other_useful_resources')
  end

  # @param name [String]
  # @return [OpenStruct]
  def placeholder_resource(name)
    ::OpenStruct.new(
      name: name,
      title: "Title for #{name}",
      body: "Body for #{name}",
      link_to_text: "Link for #{name}",
      link_to: '#',
    )
  end

  # @param page [Page]
  # @return [String]
  def card_thumbnail(page)
    thumbnail = page.thumbnail || placeholder_thumbnail
    image_tag(thumbnail.url, class: 'full-width-image', alt: thumbnail.description, title: thumbnail.title)
  end

  # @return [OpenStruct]
  def placeholder_thumbnail
    ::OpenStruct.new(
      url: 'https://placehold.co/380x254/347ca9/FFFFFF/png',
      description: 'Default description',
      title: 'Default title',
    )
  end
end
