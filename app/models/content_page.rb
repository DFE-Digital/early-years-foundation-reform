class ContentPage < ApplicationRecord

  acts_as_tree
  scope :top_level, -> { where("parent_id IS NULL") }
  validates :title, format: { with: /\A[a-zA-Z0-9 ]+\Z/, message: "Title should only contain alphabet, numeric and space characters" }, presence: true, uniqueness: true
  validates :subtitle, presence: true
  validates :markdown, presence: true
  validates :seo, presence: true

  def slug
    title.gsub(/ /, '-')
  end

end
