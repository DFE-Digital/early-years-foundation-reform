class ContentfulLayoutCacheRefreshJob < ApplicationJob
  queue_as :default

  # @param key [String]
  # @return [void]
  def perform(key)
    Page.refresh_layout_collection!(key)
  end
end
