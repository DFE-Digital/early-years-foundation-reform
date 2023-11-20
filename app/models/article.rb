class Article < ApplicationRecord
  audited

  extend FriendlyId

  friendly_id :title, use: :slugged

  validates :title, :description, :markdown, presence: true
  validates :description, length: { maximum: 254 }

  enum status: {
    draft: "draft",
    published: "published",
    unpublished: "unpublished",
  }, _default: "draft"
end
