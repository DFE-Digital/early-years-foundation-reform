class ContentAssetPolicy
  attr_reader :user, :content_asset

  def initialize(user, content_asset)
    @user = user
    @content_asset = content_asset
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
