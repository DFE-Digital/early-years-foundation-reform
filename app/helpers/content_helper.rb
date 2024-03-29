module ContentHelper
  # @see [CustomMarkdown config/initializers/markdown.rb]
  # @param key [String]
  # @return [String]
  def m(key, headings_start_with: 'l', **args)
    return '' if key.nil?

    markdown = I18n.exists?(key, scope: args[:scope]) ? t(key, **args) : key.to_s

    CustomMarkdown.render(markdown, headings_start_with:, filter_html: false).html_safe
  rescue Contentful::Error
    CustomMarkdown.render(key).html_safe
  end

  def nav_list(page)
    if page.children.any?
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

  def signup
    Resource.by_name('ctas.signup') || null_resource('ctas.signup')
  end

  def feedback
    Resource.by_name('ctas.feedback') || null_resource('ctas.feedback')
  end

  def child_development_training
    Resource.by_name('ctas.child_development_training') || null_resource('ctas.child_development_training')
  end

  def other_useful_resources
    Resource.by_name('other_useful_resources') || null_resource('other_useful_resources')
  end

  def null_resource(name)
    OpenStruct.new(
      name: name,
      title: "Title for #{name}",
      body: "Body for #{name}",
      link_to_text: "Link for #{name}",
      link_to: '#',
    )
  end
end
