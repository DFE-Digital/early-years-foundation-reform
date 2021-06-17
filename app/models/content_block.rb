class ContentBlock < ApplicationRecord
    audited

    validates :markdown, presence: true
    validates :name, presence: true
    validates :description, presence: true
end
