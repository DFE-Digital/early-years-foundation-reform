class ContentPage < ApplicationRecord
  acts_as_tree
  audited

  scope :top_level, -> { where("parent_id IS NULL") }
  scope :order_by_position, -> { order("position ASC") }

  CHARS_TO_OMIT_FROM_SLUG = ",.()".freeze
  ONLY_ALPHA_NUMERIC_COMMA_HYPHEN_SPACE_AND_ROUND_BRACES = /\A[a-zA-Z0-9,.\-\(\) ]+\Z/.freeze
  TITLE_FORMAT_ERROR_MESSAGE = "should only contain alphabetic, numeric and -#{CHARS_TO_OMIT_FROM_SLUG}".freeze
  validates :title, format: { with: ONLY_ALPHA_NUMERIC_COMMA_HYPHEN_SPACE_AND_ROUND_BRACES, message: TITLE_FORMAT_ERROR_MESSAGE }
  validates :title, presence: true, uniqueness: true
  validates :markdown, presence: true

  validates :position, presence: true, numericality: { only_integer: true }
  validates :position, uniqueness: { scope: :parent_id }

  before_save :set_slug_from_title

  after_commit do
    ContentPage.reorder
  end

  def full_path
    if parent
      "/" + parent.slug.to_s + "/" + slug.to_s
    else
      slug.to_s
    end
  end

  def set_slug_from_title
    self.slug = title.downcase.gsub(/ /, "-")
    CHARS_TO_OMIT_FROM_SLUG.each_char do |character|
      self.slug = slug.gsub(character, "")
    end
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
