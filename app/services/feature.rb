class Feature
  def self.enabled?(feature_name)
    case feature_name.to_sym
    when :support_articles
      Rails.env.include?("development", "deployed_development", "test") || Rails.config.x.enabled_feature = "support_articles"
    else
      true
    end
  end
end
