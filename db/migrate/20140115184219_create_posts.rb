class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :body
      t.string :photo_url
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
