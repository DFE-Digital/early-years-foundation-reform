class User < ApplicationRecord
  acts_as_paranoid

  ADMIN = "admin".freeze
  EDITOR = "editor".freeze
  APPROVED_DOMAINS = %w[@education.gov.uk @digital.education.gov.uk].freeze

  ROLES = %w[reader editor admin].freeze
  enum role: ROLES.zip(ROLES).to_h

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :timeoutable,
         :lockable,
         :session_limitable,
         :secure_validatable

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Email must be valid format" }
  validates :email, presence: true, if: :domain_check
  validates :email, uniqueness: true

  validates :role, presence: true
  validates :role, with: :ensure_at_least_one_user_has_admin_role

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

  def ensure_at_least_one_user_has_admin_role
    if changes["role"] && (changes["role"].first == ADMIN) && (User.admin.count <= 1)
      errors.add(:role, "Can not remove the 'admin' role, there would be no admin left")
    end
  end

  def domain_check
    unless APPROVED_DOMAINS.any? { |word| email.end_with?(word) }
      errors.add(:email, "Email address must be from an approved domain: #{APPROVED_DOMAINS.to_sentence}")
    end
  end
end
