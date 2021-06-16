class ContentPagePolicy
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
    user.editor?
  end

  def new?
    user.editor?
  end

  def update?
    user.editor?
  end

  def edit?
    user.editor?
  end

  def destroy?
    user.editor?
  end
end
