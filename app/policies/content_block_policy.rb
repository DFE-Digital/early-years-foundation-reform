class ContentBlockPolicy
  attr_reader :user, :content_block

  def initialize(user, content_block)
    @user = user
    @content_block = content_block
  end

  def create?
    permissions?
  end

  def update?
    permissions?
  end

private

  def permissions?
    user.admin?
  end
end
