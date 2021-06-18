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

  def insert_block(block_name)
    block = ContentBlock.find_by_name(block_name)
    html_to_use = "Error - block not found"
    if block
      html_to_use = ContentBlock.find_by_name(block_name).markdown
    end

    # GovspeakToHTML.new.translate_markdown markdown
    html_to_use
  end
end
