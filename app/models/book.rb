class Book < ActiveRecord::Base
  belongs_to :category 
  
  validate :
  
  
  def add_to_favorite(user_id,chapter_id)
    
    
  end
  
  def exits_in_favorite(user_id)
    return false
  end
  
  
  
end
