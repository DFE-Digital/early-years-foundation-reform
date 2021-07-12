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
    permissions?
  end

  def destroy?
    user != record && permissions?
  end

  def change_role?
    user != record && permissions?
  end

private

  def permissions?
    user.admin?
  end
end
