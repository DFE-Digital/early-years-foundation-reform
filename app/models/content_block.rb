class ContentBlock < ApplicationRecord
  audited
  # rubocop:disable Rails/UniqueValidationWithoutIndex
  validates :name, uniqueness: true
  # rubocop:enable Rails/UniqueValidationWithoutIndex
  validates :name, presence: true, format: { without: /\s/, message: "must contain no spaces" }
  validates :description, presence: true

  validates :markdown, presence: true
end
