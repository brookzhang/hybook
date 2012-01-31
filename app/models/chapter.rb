class Chapter < ActiveRecord::Base
  belongs_to :section 
  
  #Chapter.last_sequence(@section.id)
  def self.last_sequence(section_id)
    last_chapter = Chapter.where("section_id= ?", section_id).order("sequence desc").first
    if last_chapter
      return last_chapter.sequence + 1
    else
      return 1
    end
  end
  
end
