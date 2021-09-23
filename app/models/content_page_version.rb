class ContentPageVersion < ApplicationRecord
  audited

  scope :order_by_created_at, -> { order("created_at DESC") }

  belongs_to :content_page

  validates :markdown, presence: true

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
