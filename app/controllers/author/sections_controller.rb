class Author::SectionsController < Author::BaseController
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
    
    if @book.user_id != current_user.id
      flash[:notice] = "Not yourself book."
      redirect_to :back  and return
    end
    
    if @section.update_attributes(params[:section])
      redirect_to author_book_section_path(@book,@section)
    else
      redirect_to :back
    end
  end
  
  
  def destroy
    @book = Book.find(params[:book_id])
    @section = Section.find(params[:id])
    
    if @book.user_id != current_user.id
      flash[:notice] = "Not yourself book."
      redirect_to :back and return
    end
    
    
    if @book.destroy
      redirect_to author_books_path
    else
      flash[:notice] = "Deleted failed."
      redirect_to :back
    end
      
  end
end
