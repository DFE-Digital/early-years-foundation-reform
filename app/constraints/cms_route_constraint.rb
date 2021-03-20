# app/constraints/cms_route_constraint.rb

# In production (on a CloudFoundary server), disable the
# cms and devise routes unless the subdomain contains
# the string 'cms'
class CmsRouteConstraint
  def matches?(request)
    if Rails.env.production?
      /.*cms.*/.match request.subdomain
    else
      true
    end
  end
end
