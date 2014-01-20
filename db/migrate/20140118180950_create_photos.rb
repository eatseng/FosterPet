class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :user_id, :null => false
      t.string :photo_url, :null => false
      t.string :description, :null => false

      t.timestamps
    end
  end
end
