class ContentPage < ApplicationRecord
  acts_as_tree

  scope :top_level, -> { where("parent_id IS NULL") }
  scope :order_by_position, -> { order("position ASC") }

  ONLY_ALPHA_NUMERIC_COMMA_HYPHEN_AND_SPACE = /\A[a-zA-Z0-9,.\- ]+\Z/.freeze
  validates :title, format: { with: ONLY_ALPHA_NUMERIC_COMMA_HYPHEN_AND_SPACE, message: "should only contain alphabetic, numeric, comma, fullstop, hyphen and space characters" }
  validates :title, presence: true, uniqueness: true
  validates :subtitle, presence: true
  validates :markdown, presence: true
  validates :seo, presence: true

  validates :position, presence: true, numericality: { only_integer: true }
  validates :position, uniqueness: { scope: :parent_id }

  before_save :set_slug_from_title

  after_commit do
    ContentPage.reorder
  end

  def set_slug_from_title
    self.slug = title.downcase.gsub(/ /, "-").gsub(",", "").gsub(".", "")
  end

  def next_page
    my_index = ContentPage.ordering.index(self)

    # Last page uses the first page as next
    if self == ContentPage.ordering.last
      my_index = -1
    end

    ContentPage.ordering[my_index + 1]
  end

  def previous_page
    my_index = ContentPage.ordering.index(self)
    # The page before the first just works out as the last page
    ContentPage.ordering[my_index - 1]
  end

  # Avoid hitting the database every time we need the next
  # page. Memoize the ordering instead
  class << self
    def ordering
      @ordering ||= page_ordering
    end

    def reorder
      @ordering = page_ordering
    end

    def page_ordering
      page_order = []

      ContentPage.top_level.order_by_position.each do |p|
        page_order << p
        p.children.order_by_position.each do |child|
          page_order << child
        end
      end

      page_order
    end
  end
end
