class ContentBlock < ApplicationRecord
  audited
  validates :name, uniqueness: true
  validates :name, presence: true, format: { without: /\s/, message: "must contain no spaces" }
  validates :description, presence: true

  validates :markdown, presence: true
end
