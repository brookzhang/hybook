class ChaptersController < ApplicationController
  def index
    @book = Book.find(params[:book_id])
    @section = Section.find(params[:section_id])
    @chapters = Chapter.where(" section_id = ?",@section.id).all()
  end

  def show
    @book = Book.find(params[:book_id])
    @section = Section.find(params[:section_id])
    @chapter = Chapter.find(params[:id])
    @chapter.new_click
  end
  
end
