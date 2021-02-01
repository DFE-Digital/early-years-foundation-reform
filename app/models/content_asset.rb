class ContentAsset < ApplicationRecord
  has_one_attached :avatar
  validates :title, presence: true
  validates :avatar, presence: true
  validates :alt, presence: true
end
