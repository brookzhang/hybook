class Category < ActiveRecord::Base
  has_many :books
  has_many :children, :class_name => :Category ,:foreign_key => :parent_id #, :dependent => true #删除父节点时删除子节点
  
  belongs_to :parent, :class_name => :Category 
end
