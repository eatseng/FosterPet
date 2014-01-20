class CreatePhotoposttags < ActiveRecord::Migration
  def change
    create_table :photoposttags do |t|
      t.integer :photo_id, :null => false
      t.integer :post_id, :null => false

      t.timestamps
    end
  end
end
