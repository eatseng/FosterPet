class CreatePublicshares < ActiveRecord::Migration
  def change
    create_table :publicshares do |t|
      t.integer :post_id, :null => false
      t.references :publicable, polymorphic: true, :null => false

      t.timestamps
    end
  end
end
