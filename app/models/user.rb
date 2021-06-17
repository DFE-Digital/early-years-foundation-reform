class User < ApplicationRecord
  acts_as_paranoid

  ADMIN = "admin".freeze

  enum role: { reader: "reader", editor: "editor", admin: ADMIN }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :timeoutable,
         :lockable,
         :session_limitable,
         :secure_validatable

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }
  validates :role, presence: true
  validates :role, with: :presence_of_role

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
    valid = roles.slice("editor", ADMIN) # rubocop:todo Lint/UselessAssignment
  end

  def ensure_at_least_one_user_has_admin_role
    if changes["role"] && (changes["role"].first == ADMIN) && (User.admin.count <= 1)
      errors.add(:role, "Can not remove the 'admin' role, there would be no admin left")
    end
  end

  def presence_of_role
    unless role
      errors.add(:role, "Role is required")
    end
  end
end
