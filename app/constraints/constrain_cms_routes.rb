class CmsRouteConstraint
  def initialize(type)
    @type = type
  end
  def matches?(request)
    resource = current_resource(request)
    resource.type == @type
  rescue ActiveRecord::RecordNotFound
    false
  end
  def current_resource(request)
    Resource.find(request[:resource_id])
  end
end
