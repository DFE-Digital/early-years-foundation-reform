class ContentAsset < ApplicationRecord
  has_one_attached :asset_file
  validates :title, presence: true
  validates :asset_file, presence: true
  validates :alt_text, presence: true
end
