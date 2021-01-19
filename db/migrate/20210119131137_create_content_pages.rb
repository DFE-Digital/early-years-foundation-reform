class CreateContentPages < ActiveRecord::Migration[6.1]
  def change
    create_table :content_pages do |t|
      t.string :title
      t.string :slug
      t.string :markdown
      t.string :seo

      t.timestamps
    end
  end
end
