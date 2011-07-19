class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :category_id          
      t.integer :user_id              
      t.string :title                
      t.string :description           
      t.string :keywords             
      t.string :cover_picture_url     
      t.boolean :author,:default=>false
      t.integer :status,:default=>0
      t.integer :all_click,:default=>0
      t.integer :month_click,:default=>0
      t.integer :week_click,:default=>0
      t.integer :day_click,:default=>0
      t.datetime :last_click_at
      t.timestamps
    end
    
    add_index :books , :user_id
    add_index :books , :category_id
  end
end
