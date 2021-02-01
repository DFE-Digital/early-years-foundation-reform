class AddParentIdToContentPages < ActiveRecord::Migration[6.1]
  change_table :content_pages, bulk: true do |t|
    t.integer :parent_id
    t.integer :position
  end
end
