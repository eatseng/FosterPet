class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name, :null => false
      t.string :photo_url
      t.string :likes
      t.string :dislikes
      t.string :age
      t.string :gender
      t.string :breed
      t.string :size
      t.string :about
      t.integer :owner_id
      t.string :slug

      t.timestamps
    end
    add_index :pets, :slug, :unique => true
  end
end
