class Feature
  def self.enabled?(feature_name)
    case feature_name.to_sym
    when :support_articles
      Rails.configuration.x.features.support_articles == "enabled"
    else
      true
    end
  end
end
