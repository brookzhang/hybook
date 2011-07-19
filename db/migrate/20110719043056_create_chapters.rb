class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.integer :section_id
      t.integer :sequence
      t.string :title
      t.string :content
      t.boolean :public,:default=>true

      t.timestamps
    end
    
    add_index :chapters,:section_id
  end
end
