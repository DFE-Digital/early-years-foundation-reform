class ContentPageVersionPolicy < ApplicationPolicy
  def update?
    permissions?
  end

  def destroy?
    permissions?
  end

private

  def permissions?
    user.editor? || user.admin?
  end
end
