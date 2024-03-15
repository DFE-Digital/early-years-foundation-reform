class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  devise :database_authenticatable,
         :recoverable,
         :timeoutable,
         :lockable,
         :session_limitable,
         :secure_validatable

  def name
    [first_name, last_name].join(' ')
  end
end
