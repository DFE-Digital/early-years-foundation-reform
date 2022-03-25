module ContentHelper
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
end
