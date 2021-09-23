class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.string :slug
      t.string :markdown

      t.timestamps
    end
    add_index :articles, :slug, unique: true
  end
end
