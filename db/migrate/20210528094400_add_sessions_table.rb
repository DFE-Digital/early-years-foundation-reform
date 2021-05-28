class AddSessionsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
<<<<<<< HEAD
      t.string :session_id, null: false
=======
      t.string :session_id, :null => false
>>>>>>> 4764d047 (Add active record session store)
      t.text :data
      t.timestamps
    end

<<<<<<< HEAD
    add_index :sessions, :session_id, unique: true
=======
    add_index :sessions, :session_id, :unique => true
>>>>>>> 4764d047 (Add active record session store)
    add_index :sessions, :updated_at
  end
end
