module ContentHelper
  # @see [CustomMarkdown config/initializers/markdown.rb]
  # @param key [String]
  # @return [String]
  def m(key, headings_start_with: 'l', **args)
    return "" if key.nil?

    markdown = I18n.exists?(key, scope: args[:scope]) ? t(key, **args) : key.to_s

    CustomMarkdown.render(markdown, headings_start_with:, filter_html: false).html_safe
  rescue Contentful::Error
    CustomMarkdown.render(key).html_safe
  end

  def path_for_this_page(page)
    # Add parent links
    if page.parent_id
      "/#{page.parent.slug}/#{page.slug}"
    else
      "/#{page.slug}"
    end
  end

  def is_current?(page)
    params[:slug] == page.slug
  end

  # This is not nice, but necessary. It is here because of the
  # 'Overview' menu items inserted into the mobile menu.  Without
  # this extra check, the Overview menus appear as current when
  # they are now. Sorry
  def is_mobile_menu_section_current?(page)
    params[:slug] == page.slug || params[:section] == page.slug
  end

  def translate_markdown(markdown)
    raw GovspeakDecorator.translate_markdown(markdown)
  end

  def insert_block(block_name)
    block = ContentBlock.find_by_name(block_name.underscore)
    html_to_use = block ? block.markdown : "Error - block not found for #{block_name.humanize}"

    translate_markdown(html_to_use)
  end

  def print_button(*additional_classes)
    button = '<button class="govuk-link gem-c-print-link__button" onclick="window.print()" data-module="print-link" >Print this page</button>'.html_safe
    classes = ["gem-c-print-link", "print-button"] + additional_classes
    content_tag :div, button, class: classes
  end

  def govuk_input_classes(input_type, errors: nil)
    classes = %w[govuk-input]
    classes << "govuk-#{input_type}"
    classes << "govuk-input--error" if errors.present?
    classes
  end

  #    ul.dfe-vertical-nav__section
  #      li.dfe-vertical-nav__section-item class="dfe-vertical-nav__section-item--current"
  #        = link_to('Overview', page.path, class: 'dfe-vertical-nav__link')
  #        - page.children.each do |child|
  #          li.dfe-vertical-nav__section-item
  #            = link_to(child.title, child.path, class: 'dfe-vertical-nav__link')

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
    @signup ||= Web::Resource.by_name('ctas.signup')
  end

  def feedback
    @feedback ||= Web::Resource.by_name('ctas.signup')
  end

  def child_development_training
    @child_development_training ||= Web::Resource.by_name('ctas.child_development_training')
  end
end
