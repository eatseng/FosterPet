class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :body, :null => false
      t.integer :user_id, :null => false
      t.integer :pet_id, :null => false

      t.timestamps
    end
  end
end
