class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.integer :user_id, :null => false
      t.integer :pet_id, :null => false

      t.timestamps
    end
    add_index :followings, [:pet_id, :user_id], :unique => true
  end
end
