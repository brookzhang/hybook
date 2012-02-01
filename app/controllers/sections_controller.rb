class SectionsController < ApplicationController
  def index
    @book = Book.find(params[:book_id])
    @sections = Section.where("book_id=?",@book.id).order("sequence asc")
  end

  def show
    @book = Book.find(params[:book_id])
    @section = Section.find(params[:id])
    @chapters = Chapter.where("section_id=?",@section.id)
  end
end
