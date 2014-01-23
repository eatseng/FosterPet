class CreateUserdescriptions < ActiveRecord::Migration
  def change
    create_table :userdescriptions do |t|
      t.integer :user_id, :null => false
      t.string :first_name
      t.string :last_name
      t.string :profession
      t.string :age
      t.string :about

      t.timestamps
    end
  end
end
