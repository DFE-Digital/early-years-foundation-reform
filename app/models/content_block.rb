class ContentBlock < ApplicationRecord
  audited

  validates :name,
            presence: true,
            format: { without: /\s/, message: "must contain no spaces" }
  unique :name
  validates :description, presence: true

  validates :markdown, presence: true
end
