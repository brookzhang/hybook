class BooksController < ApplicationController
  def index
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
    if params[:favorite] == "Add"
      @book.add_to_favorite(current_user.id,0)
      flash[:success] = "Add to favorite successfully!"
    end
  end
  
  
  
  
  
end
