class ContentPage < ApplicationRecord
  acts_as_tree

  scope :top_level, -> { where("parent_id IS NULL") }
  scope :order_by_position, -> { order('position ASC') }

  validates :title, format: { with: /\A[a-zA-Z0-9 ]+\Z/, message: "Title should only contain alphabet, numeric and space characters" }, presence: true, uniqueness: true
  validates :subtitle, presence: true
  validates :markdown, presence: true
  validates :seo, presence: true

  validates :position, presence: true, format: { with: /\A\d+\z/, message: "Integer only, no sign allowed" }
  validates_uniqueness_of :position, scope: :parent_id

  before_save :set_slug_from_title
  before_create :set_slug_from_title

  def set_slug_from_title
    Rails.logger.debug "setting slug"
    self.slug = title.downcase.gsub(/ /, '-')
  end
end
