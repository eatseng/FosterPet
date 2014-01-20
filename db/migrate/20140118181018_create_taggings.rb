class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :photo_id, :null => false
      t.references :tagable, polymorphic: true, :null => false

      t.timestamps
    end
  end
end
