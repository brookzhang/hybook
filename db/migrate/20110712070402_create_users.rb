class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password
      t.string :super_password
      t.string :active_code
      t.boolean :male ,:default=>true
      t.string :description
      t.integer :reader_score
      t.integer :maxfavorite,:default=>10
      t.integer :maxbook,:default=>10
      t.boolean :admin ,:default=>false
      t.boolean :maintainer,:default=>false
      t.boolean :author,:default=>false
      t.string :author_name
      t.timestamps
    end
  end
end
