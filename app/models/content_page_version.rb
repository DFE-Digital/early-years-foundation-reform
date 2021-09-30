class ContentPageVersion < ApplicationRecord
  audited

  scope :order_by_created_at, -> { order("created_at DESC") }

  belongs_to :content_page

  validates :markdown, presence: true
  validates :title, presence: true

  validates :title, format: { with: ContentPage::ONLY_ALPHA_NUMERIC_COMMA_HYPHEN_SPACE_AND_ROUND_BRACES, message: ContentPage::TITLE_FORMAT_ERROR_MESSAGE }

  def navigation
    true
  end

  def breadcrumbs
    true
  end

  delegate :parent, to: :content_page

  def parent_id
    content_page&.parent&.id
  end
end
