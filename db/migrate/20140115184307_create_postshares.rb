class CreatePostshares < ActiveRecord::Migration
  def change
    create_table :postshares do |t|
      t.integer :post_id, :null => false
      t.references :postable, polymorphic: true, :null => false
      t.boolean :show, :default => false

      t.timestamps
    end
  end
end
