class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :null => false
      t.string :email
      t.string :password_digest, :null => false
      t.string :session_token, :null => false
      t.string :account_type, :default => "user"
      t.string :photo_url
      t.string :slug

      t.timestamps
    end

    add_index :users, :username, :unique => true
    add_index :users, :session_token, :unique => true
    add_index :users, :slug, :unique => true
  end
end
