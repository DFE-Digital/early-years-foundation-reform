class Feedback < ApplicationRecord
  validates :page_useful, inclusion: { in: %w[yes no] }
  validates :page_url, presence: true
end
