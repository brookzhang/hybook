class Chapter < ActiveRecord::Base
  belongs_to :section 
  
  #Chapter.last_sequence(@section.id)  
  #for new chapter's sequence auto set
  def self.last_sequence(section_id)
    last_chapter = Chapter.where("section_id= ?", section_id).order("sequence desc").first
    if last_chapter
      return last_chapter.sequence + 1
    else
      return 1
    end
  end
  
  #navigate to the previous chapter
  def previous_id
    previous_chapter = Chapter.where("book_id=? and section_id=? and sequence<=? and id<>?",self.book_id,self.section_id,self.sequence,self.id).order("sequence desc").limit(1)
    if previous_chapter.count==0
      previous_chapter = Chapter.where("book_id=? and section_id<? ",self.book_id,self.section_id).order("sequence desc").limit(1)
    end
    
    if previous_chapter.count==1
      previous_chapter.first.id
    else
      0
    end
    
  end
  
  
  #navigate to the next chapter
  def next_id
    next_chapter = Chapter.where("book_id=? and section_id=? and sequence>=? and id<>?",self.book_id,self.section_id,self.sequence,self.id).order("sequence asc").limit(1)
    if next_chapter.count==0
      next_chapter = Chapter.where("book_id=? and section_id>? ",self.book_id,self.section_id).order("sequence asc").limit(1)
    end
    
    if next_chapter.count==1
      next_chapter.first.id
    else
      0
    end
    
  end
  
  
  #when chapter/:id/show load, reflash book clicks
  def new_click
    @book = Book.find(self.book_id)
    @book.all_click += 1
    @book.last_click_at = @book.last_click_at.nil? ? DateTime.now : @book.last_click_at
    if DateTime.now - 1.days >= @book.last_click_at
      @book.day_click =1
    else
      @book.day_click +=1
      if DateTime.now -  1.weeks > @book.last_click_at 
        @book.week_click =1
      else
        @book.week_click +=1
        if DateTime.now -  1.months > @book.last_click_at
          @book.month_click =1
        else
          @book.month_click +=1
        end
      end
    end
    @book.last_click_at = DateTime.now
    @book.save
  end
  
end
