class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.integer :user_id, :null => false
      t.integer :pet_id, :null => false

      t.timestamps
    end
  end
end
