# @see https://github.com/ruby-i18n/i18n/wiki/Fallbacks
# require 'i18n/backend/fallbacks'
# I18n::Backend::Simple.include I18n::Backend::Fallbacks

# Contentful powered locales using `Resource` model
#
# @see https://github.com/ruby-i18n/i18n/wiki/Backend

module I18n::Backend::Content
  # @return [String, nil]
  def lookup(locale, key, scope = [], options = {})
    original = super
    resource_name = scope ? Array(scope).push(key).join('.') : key
    find_resource(resource_name)&.body || original
  end

private

  # @return [Web::Resource, nil]
  def find_resource(resource_name)
    Web::Resource.by_name(resource_name)
  end
end

I18n::Backend::Simple.include I18n::Backend::Content
