class UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.admin?
  end

  def update?
    # A user with role 'admin' is not allowed to edit their own role
    if user == record
      !(user.role == User::ADMIN)
    else
      user.admin?
    end
  end

  def destroy?
    user.admin?
  end
end
