class ContentPage < ApplicationRecord
  validates :title, presence: true
  validates :slug, presence: true
  validates :markdown, presence: true
  validates :seo, presence: true
end
