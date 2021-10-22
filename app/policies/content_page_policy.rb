class ContentPagePolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def show?
    user.present?
  end

  def create?
    permissions?
  end

  def update?
    permissions?
  end

  def destroy?
    permissions?
  end

  def unpublish?
    permissions? && record.is_published
  end

private

  def permissions?
    user.editor? || user.admin?
  end
end
