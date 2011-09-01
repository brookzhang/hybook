class Maintain::ChaptersController < Maintain::BaseController
  def index
    @book = Book.find(params[:book_id])
    @chapters = Chapter.where(" book_id = ?",@book.id).all()
  end

  def show
    @book = Book.find(params[:book_id])
    @chapter = Chapter.find(params[:id])
  end

  def new
    @book = Book.find(params[:book_id])
    @chapter = Chapter.new()
  end

  def create
    @book = Book.find(params[:book_id])
    @chapter = Chapter.new(params[:chapter])
    @chapter.book_id = @book.id
    if @chapter.save
      redirect_to(:action => 'show', :id => @chapter)
    else
      redirect_to(:action => 'index')
    end
  end

  def edit
    @book = Book.find(params[:book_id])
    @chapter = Chapter.find(params[:id])
  end

  def update
    @book = Book.find(params[:book_id])
    @chapter = Chapter.find(params[:id])
    if @chapter.update_attributes(params[:chapter])
      redirect_to(:action => 'show', :id => @chapter)
    else
      redirect_to(:action => 'index')
    end
  end

end
