class AddColumnToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :book_id, :int
  end
end
