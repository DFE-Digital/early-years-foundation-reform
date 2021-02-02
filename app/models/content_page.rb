class ContentPage < ApplicationRecord
  acts_as_tree
  scope :top_level, -> { where("parent_id IS NULL") }

  validates :title, presence: true, uniqueness: true
  validates :subtitle, presence: true
  validates :markdown, presence: true
  validates :seo, presence: true
end
