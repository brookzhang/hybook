class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.integer :book_id
      t.integer :comment_id
      t.integer :forked_id
      t.integer :user_id
      t.string :content

      t.timestamps
    end
    
    
    add_index :microposts, :book_id
    add_index :microposts, :comment_id
    add_index :microposts, :forked_id
    add_index :microposts, :user_id
  end
end
