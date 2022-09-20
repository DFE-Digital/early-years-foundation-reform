class ContentPageVersion < ApplicationRecord
  audited

  scope :order_by_created_at, -> { order("created_at DESC") }

  belongs_to :content_page

  validates :title, format: { with: ContentPage::ONLY_ALPHA_NUMERIC_COMMA_HYPHEN_SPACE_AND_ROUND_BRACES, message: ContentPage::TITLE_FORMAT_ERROR_MESSAGE }
  validates :title, presence: true
  validates :markdown, presence: true
  validates :description, length: { maximum: 254 }

  delegate :parent, :parent_id, to: :content_page, allow_nil: true

  # TODO: Are navigation and breadcrumb methods required? They do not appear to be used anywhere.
  def navigation
    true
  end
end
