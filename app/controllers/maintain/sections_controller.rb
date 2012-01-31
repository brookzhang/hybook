class Maintain::SectionsController < Maintain::BaseController
  def index
    @sections = Section.where("book_id= ?",params[:book_id]).order("sequence asc")
    @book = Book.find(params[:book_id])
  end

  def show
    @book = Book.find(params[:book_id])
    @section = Section.find(params[:id])
  end

  def new
    @book = Book.find(params[:book_id])
    @section = Section.new
    @section.sequence = Section.last_sequence(@book.id)
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
    @book = Book.find(params[:book_id])
    @section = Section.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:book_id])
    @section = Section.find(params[:id])
    if @section.update_attributes(params[:section])
      respond_to do |format|
        format.html {
          flash[:notice] = "Updated section '#{@section.title}'"
          redirect_to(:action => 'show', :id => @section)
        }
      end
    else
      respond_to do |format|
        format.html { render :action => 'show',        :status => :unprocessable_entity }
      end
    end
  end
end
