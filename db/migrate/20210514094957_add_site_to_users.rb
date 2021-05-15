class AddSiteToUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :site_id, :integer
    add_index  :users, :site_id
  end
end
