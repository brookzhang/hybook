
class Section < ActiveRecord::Base
  has_many :chapters
  
  
  def self.last_sequence(book_id)
    last_section = Section.where("book_id= ?", book_id).order("sequence desc").first
    if last_section
      return last_section.sequence + 1
    else
      return 1
    end
  end
end
