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

      t.timestamps
    end
  end
end
