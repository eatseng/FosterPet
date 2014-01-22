class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :photo_id, :null => false
      t.integer :post_id, :null => false

      t.timestamps
    end
    add_index :taggings, [:photo_id, :post_id], :unique => true
  end
end
