class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :encrypted_password
      t.string :salt
      t.string :active_code
      t.boolean :admin ,:default=>false
      t.string :user_name
      t.string :author_name
      t.timestamps
    end
  end
end
