class AddStatusToArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :status, :string, default: "draft"
    add_index :articles, :status
  end
end
