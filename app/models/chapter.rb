class Chapter < ActiveRecord::Base
  
  def last_sequence(section_id)
    return 1 unless Section.where("section_id= ?", section_id).order("sequence desc").first.sequence
  end
  
end
