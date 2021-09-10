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

  def parent
    content_page.parent
  end

  def parent_id
    content_page&.parent&.id
  end
end
