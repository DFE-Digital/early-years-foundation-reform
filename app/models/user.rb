class User < ApplicationRecord
  acts_as_paranoid

  enum role: { reader: "reader", editor: "editor", admin: "admin" }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :timeoutable,
         :lockable,
         :session_limitable,
         :secure_validatable

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }
  validates :role, presence: true

  def name
    [first_name, last_name].join(" ")
  end

  def reset_password(new_password, new_password_confirmation)
    if new_password.present?
      self.password = new_password
      self.password_confirmation = new_password_confirmation
      save!
    else
      errors.add(:password, :blank)
      false
    end
  end

  def self.valid_roles
    valid = roles.slice("editor", "admin") # rubocop:todo Lint/UselessAssignment
  end
end
