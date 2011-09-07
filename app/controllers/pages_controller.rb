class PagesController < ApplicationController
  def home
    @title = "Home"
    
    @chapters = Chapter.limit(10).order("created_at DESC")
    if signed_in?
      
    end
  end

  def toplist
    @title = "Toplist"
  end

  def about
    @title = "About"
  end

  def help
    @title = "Help"
  end
end

