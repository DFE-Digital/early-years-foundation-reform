class Feedback
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :page_useful

  validates :page_useful, inclusion: { in: %w[yes no] }
end
