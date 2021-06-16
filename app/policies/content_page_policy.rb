class ContentPagePolicy < ApplicationPolicy
  attr_reader :user, :content_page

  def initialize(user, content_page)
    @user = user
    @content_page = content_page
  end

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
