class ChaptersController < ApplicationController
  def index
    @book = Book.find(params[:book_id])
    @chapters = Chapter.where(" book_id = ?",@book.id).all()
  end

  def show
    @book = Book.find(params[:book_id])
    @chapter = Chapter.find(params[:id])
  end
  
end
