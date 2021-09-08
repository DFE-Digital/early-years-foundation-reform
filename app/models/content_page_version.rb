class ContentPageVersion < ApplicationRecord
  audited

  scope :order_by_created_at, -> { order("created_at DESC") }

  belongs_to :content_page

  validates :markdown, presence: true
end
