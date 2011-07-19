class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :book_id
      t.string :title
      t.string :description
      t.integer :sequence

      t.timestamps
    end
    
    add_index :sections,:book_id
  end
end
