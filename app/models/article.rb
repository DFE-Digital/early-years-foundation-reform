class Article < ApplicationRecord
  self.table_name = "content_pages"
  
  CHARS_TO_OMIT_FROM_SLUG = ",:()".freeze
  ONLY_ALPHA_NUMERIC_COMMA_HYPHEN_SPACE_AND_ROUND_BRACES = /\A[a-zA-Z0-9,:\-() ]+\Z/.freeze
  TITLE_FORMAT_ERROR_MESSAGE = "should only contain alphabetic, numeric and -#{CHARS_TO_OMIT_FROM_SLUG}".freeze

  validates :title, format: { with: ONLY_ALPHA_NUMERIC_COMMA_HYPHEN_SPACE_AND_ROUND_BRACES, message: TITLE_FORMAT_ERROR_MESSAGE }
  validates :title, presence: true, uniqueness: true
  validates :markdown, presence: true

  before_save :set_slug_from_title

  def set_slug_from_title
    self.slug = title.downcase.gsub(/ /, "-")
    CHARS_TO_OMIT_FROM_SLUG.each_char do |character|
      self.slug = slug.gsub(character, "")
    end
  end
end