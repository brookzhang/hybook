class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :book_id
      t.integer :user_id
      t.string :title
      t.string :content
      t.integer :all_click,:default=>0
      t.integer :status
      t.boolean :submit_to_homepage

      t.timestamps
    end
    
    add_index :comments,:book_id
    add_index :comments,:user_id
  end
end
