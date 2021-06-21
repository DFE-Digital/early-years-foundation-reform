class UserPolicy < ApplicationPolicy
  def index?
    permissions?
  end

  def show?
    permissions?
  end

  def create?
    permissions?
  end

  def update?
    # A user with role 'admin' is not allowed to edit their own role
    if user == record
      !(user.role == User::ADMIN)
    else
      permissions?
    end
  end

  def destroy?
    user != record && permissions?
  end

private

  def permissions?
    user.admin?
  end
end
