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
