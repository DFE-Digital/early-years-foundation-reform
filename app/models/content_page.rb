class ContentPage < Article 
  acts_as_tree
  audited

  scope :top_level, -> { where("parent_id IS NULL") }
  scope :order_by_position, -> { order("position ASC") }

  validates :position, presence: true, numericality: { only_integer: true }
  validates :position, uniqueness: { scope: :parent_id }

  after_create do
    ContentPage.reorder
  end

  after_save do
    if saved_change_to_position?
      ContentPage.reorder
    end
  end

  def full_path
    if parent
      "/#{parent.slug}/#{slug}"
    else
      "/#{slug}"
    end
  end

  def next_page
    ContentPage.find next_id
  end

  def previous_page
    ContentPage.find previous_id
  end

  def navigation
    true
  end

  def breadcrumbs
    true
  end

  def helpful_tools
    true
  end

  # Called when a page is created or a position attribute changes
  class << self
    def reorder
      page_order = []

      ContentPage.top_level.order_by_position.each do |p|
        page_order << p
        p.children.order_by_position.each do |child|
          page_order << child
        end
      end

      page_order.each_with_index do |page, index|
        page.next_id = if page == page_order.last
                         page_order.first.id
                       else
                         page_order[index + 1].id
                       end

        page.previous_id = if page == page_order.first
                             page_order.last.id
                           else
                             page_order[index - 1].id
                           end

        page.save!
      end
    end
  end
end
