class ContentPagePolicy
  attr_reader :user, :content_page

  def initialize(user, content_page)
    @user = user
    @content_page = content_page
  end

  def update?
    user.role == "editor"
  end

  def create?
    user.role == "editor"
  end

  def delete?
    user.role == "editor"
  end

  def new?
    user.role == "editor"
  end

  def create
    user.role == "editor"
  end
end
