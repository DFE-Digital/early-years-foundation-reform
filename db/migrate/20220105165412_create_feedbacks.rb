class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.string :page_useful
      t.string :page_url

      t.timestamps
    end
  end
end
