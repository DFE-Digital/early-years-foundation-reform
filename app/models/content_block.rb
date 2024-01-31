class ContentBlock < ApplicationRecord
  audited

  default_scope { order(name: :asc) }

  # rubocop:disable Rails/UniqueValidationWithoutIndex
  validates :name, uniqueness: true # There is also a unique index in SQL, rubocop disagrees
  # rubocop:enable Rails/UniqueValidationWithoutIndex
  validates :name, presence: true, format: { without: /\s/, message: "Name must contain no spaces" }
  validates :name, format: { with: ContentPage::ONLY_ALPHA_NUMERIC_COMMA_HYPHEN_SPACE_AND_ROUND_BRACES, message: ContentPage::TITLE_FORMAT_ERROR_MESSAGE }
  validates :name, length: { maximum: 254 }
  validates :description, presence: true
  validates :description, length: { maximum: 254 }

  validates :markdown, presence: true
  validates :markdown, length: { maximum: 30_000 }
end
