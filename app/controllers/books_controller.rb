class BooksController < ApplicationController
  def index
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end
end
