class Article < ApplicationRecord
  audited

  extend FriendlyId

  friendly_id :title, use: :slugged

  has_one_attached :featured_image
  has_one_attached :thumbnail_image

  validates :title, :description, :markdown, presence: true
end
