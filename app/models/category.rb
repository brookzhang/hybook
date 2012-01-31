class Category < ActiveRecord::Base
  has_many :books
  has_many :children, :class_name => :Category ,:foreign_key => :parent_id #, :dependent => true #删除父节点时删除子节点
  
  belongs_to :parent, :class_name => :Category 
  
  #should not be self.title_from_root , when @book.category.title_from_root
  #self.title_from_root work as Category.title_from_root(category_id)
  def title_from_root
    if self.parent_id == 0
      self.title 
    else
      self.parent.title + " - " + self.title
    end
  end
end
