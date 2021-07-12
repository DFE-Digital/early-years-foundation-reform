class CreateContentBlocks < ActiveRecord::Migration[6.1]
  def change
    create_table :content_blocks do |t|
      t.string :name
      t.string :description
      t.string :markdown

      t.timestamps
    end
  end
end
