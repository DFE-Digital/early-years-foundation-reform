class ContentBlock < ApplicationRecord
  audited

  default_scope { order(name: :asc) }

  # rubocop:disable Rails/UniqueValidationWithoutIndex
  validates :name, uniqueness: true # There is also a unique index in SQL, rubocop disagrees
  # rubocop:enable Rails/UniqueValidationWithoutIndex
  validates :name, presence: true, format: { without: /\s/, message: "Name must contain no spaces" }
  validates :description, presence: true

  validates :markdown, presence: true
end
