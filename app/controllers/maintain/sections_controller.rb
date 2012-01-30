class Maintain::SectionsController < Maintain::BaseController
  def index
    @sections = Section.where("book_id= ?",params[:book_id]).order("sequence asc")
    @book = Book.find(params[:book_id])
  end

  def show
  end

  def new
    @book = Book.find(params[:book_id])
    @section = Section.new
  end
  
  def create
    @section = Section.new(params[:section])
    @book = Book.find(params[:book_id])
    @section.book_id = @book.id
    
    if @section.save
      respond_to do |format|
        format.html {
          flash[:notice] = "Created section '#{@section.title}'!"
          redirect_to(:action =>'index' ,:id => @section)
        }
      end
    else
      redirect_to(:action =>'index' ,:id => @section)
    end
  end
    
  

  def edit
  end
end
