class ContentPagePolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def show?
    user.present?
  end

  def create?
    !user.reader?
  end

  def update?
    !user.reader?
  end

  def destroy?
    !user.reader?
  end
end
