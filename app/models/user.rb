class User < ApplicationRecord
  acts_as_paranoid

  ADMIN = "admin".freeze
  EDITOR = "editor".freeze

  ROLES = %w[reader editor admin].freeze
  enum role: ROLES.zip(ROLES).to_h

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :timeoutable,
         :lockable,
         :session_limitable,
         :secure_validatable

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }
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
    roles.slice("editor", "admin").transform_values do |value|
      I18n.translate(value, scope: :roles, default: "Unknown role")
    end
  end

  def self.list_of_valid_roles
    valid_roles.values.to_sentence(last_word_connector: "or")
  end

  def ensure_at_least_one_user_has_admin_role
    if changes["role"] && (changes["role"].first == ADMIN) && (User.admin.count <= 1)
      errors.add(:role, "Can not remove the 'admin' role, there would be no admin left")
    end
  end

  def presence_of_role
    unless role
      errors.add(:role, "Role is required. Select one of #{User.list_of_valid_roles}")
    end
  end
end
