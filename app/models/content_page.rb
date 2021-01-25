class ContentPage < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :subtitle, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :markdown, presence: true
  validates :seo, presence: true
end
