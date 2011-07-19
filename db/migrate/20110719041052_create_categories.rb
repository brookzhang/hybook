class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :parent_id ,:default=>0
      t.string :title
      t.string :description
      t.boolean :show_on_header ,:default=>false
      t.integer :sequence

      t.timestamps
    end
    
  end
end
