class ContentPage < ApplicationRecord
  acts_as_tree

  scope :top_level, -> { where("parent_id IS NULL") }
  scope :order_by_position, -> { order("position ASC") }

  ONLY_ALPHA_NUMERIC_AND_SPACE = /\A[a-zA-Z0-9,. ]+\Z/.freeze
  validates :title, format: { with: ONLY_ALPHA_NUMERIC_AND_SPACE, message: "should only contain alphabetic, numeric, comma, fullstop and space characters" }
  validates :title, presence: true, uniqueness: true
  validates :subtitle, presence: true
  validates :markdown, presence: true
  validates :seo, presence: true

  validates :position, presence: true, numericality: { only_integer: true }
  validates :position, uniqueness: { scope: :parent_id }

  before_save :set_slug_from_title

  def set_slug_from_title
    self.slug = title.downcase.gsub(/ /, "-").gsub(",", "").gsub(".", "")
  end
end
