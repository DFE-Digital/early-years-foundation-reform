class ContentPagePolicy < ApplicationPolicy
  attr_reader :user, :content_page

  def initialize(user, content_page)
    @user = user
    @content_page = content_page
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.role == "editor"
  end

  def new?
    user.role == "editor"
  end

  def update?
    user.role == "editor"
  end

  def edit?
    user.role == "editor"
  end

  def destroy?
    user.role == "editor"
  end
end
