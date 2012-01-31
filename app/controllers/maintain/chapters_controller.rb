class Maintain::ChaptersController < Maintain::BaseController
  def index
    @book = Book.find(params[:book_id])
    @section = Section.find(params[:section_id])
    @chapters = Chapter.where(" section_id = ?",@section.id).order("sequence asc")
  end

  def show
    @book = Book.find(params[:book_id])
    @section = Section.find(params[:section_id])
    @chapter = Chapter.find(params[:id])
  end

  def new
    @book = Book.find(params[:book_id])
    @section = Section.find(params[:section_id])
    @chapter = Chapter.new()
    @chapter.sequence = Chapter.last_sequence(@section.id)
  end

  def create
    @book = Book.find(params[:book_id])
    @section = Section.find(params[:section_id])
    @chapter = Chapter.new(params[:chapter])
    @chapter.book_id = @book.id
    @chapter.section_id = @section.id
    if @chapter.save
      redirect_to(:action => 'show', :id => @chapter)
    else
      redirect_to(:action => 'index')
    end
  end

  def edit
    @book = Book.find(params[:book_id])
    @section = Section.find(params[:section_id])
    @chapter = Chapter.find(params[:id])
  end

  def update
    @book = Book.find(params[:book_id])
    @section = Section.find(params[:section_id])
    @chapter = Chapter.find(params[:id])
    if @chapter.update_attributes(params[:chapter])
      redirect_to(:action => 'show', :id => @chapter)
    else
      redirect_to(:action => 'index')
    end
  end

end
