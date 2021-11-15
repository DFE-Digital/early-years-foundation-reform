class Feature
  def self.enabled?(feature_name)
    case feature_name.to_sym
    when :support_articles
      !Rails.env.production?
    else
      true
    end
  end
end
