# Even the author of this Cop thinks it is too restrictive
# https://github.com/rubocop/rubocop-rails/issues/110
# It would make the migration harder to read and longer
# rubocop:disable Rails/BulkChangeTable

class RemoveSeoFromContentPages < ActiveRecord::Migration[6.1]
  def up
    remove_column :content_pages, :seo
    remove_column :content_pages, :subtitle
  end

  def down
    add_column :content_pages, :seo
    add_column :content_pages, :subtitle
  end
end

# rubocop:enable Rails/BulkChangeTable
