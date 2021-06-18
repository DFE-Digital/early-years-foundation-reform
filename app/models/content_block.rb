class ContentBlock < ApplicationRecord
    audited

    validates :name,
              presence: true,
              format: { without: /\s/, message: "must contain no spaces" },
              uniqueness: true
    validates :description, presence: true

    validates :markdown, presence: true
end
