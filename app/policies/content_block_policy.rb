class ContentBlockPolicy
  attr_reader :user, :content_block

  def initialize(user, content_block)
    @user = user
    @content_block = content_block
  end

  def index?
    permissions?
  end

  def show?
    permissions?
  end

  def create?
    permissions?
  end

  def new?
    permissions?
  end

  def update?
    permissions?
  end

  def edit?
    permissions?
  end

  def get?
    permissions?
  end

  def destroy?
    permissions?
  end

private

  def permissions?
    user.admin?
  end
end
