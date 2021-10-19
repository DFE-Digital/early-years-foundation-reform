class ContentPage < ApplicationRecord
  acts_as_tree
  audited

  has_many :content_page_versions

  scope :top_level, -> { where("parent_id IS NULL") }
  scope :order_by_position, -> { order("position ASC") }
  scope :published, -> { where("is_published = true") }

  CHARS_TO_OMIT_FROM_SLUG = ",:()".freeze
  ONLY_ALPHA_NUMERIC_COMMA_HYPHEN_SPACE_AND_ROUND_BRACES = /\A[a-zA-Z0-9,:\-() ]+\Z/.freeze
  TITLE_FORMAT_ERROR_MESSAGE = "Heading should only contain alphabetic, numeric and -#{CHARS_TO_OMIT_FROM_SLUG}".freeze
  validates :title, format: { with: ONLY_ALPHA_NUMERIC_COMMA_HYPHEN_SPACE_AND_ROUND_BRACES, message: TITLE_FORMAT_ERROR_MESSAGE }
  validates :title, presence: true, uniqueness: true
  validates :markdown, presence: true

  validates :position, presence: true, numericality: { only_integer: true }
  validates :position, uniqueness: { scope: :parent_id }

  before_save :set_slug_from_title

  after_create do
    ContentPage.reorder
    create_first_version
  end

  def create_first_version
    ContentPageVersion.create!(title: title,
                               markdown: markdown,
                               content_page_id: id,
                               author: author)
  end

  after_save do
    if saved_change_to_position? || saved_change_to_is_published?
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

  def set_slug_from_title
    self.slug = title.downcase.gsub(/ /, "-")
    CHARS_TO_OMIT_FROM_SLUG.each_char do |character|
      self.slug = slug.gsub(character, "")
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

      ContentPage.published.top_level.order_by_position.each do |p|
        page_order << p
        p.children.published.order_by_position.each do |child|
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
