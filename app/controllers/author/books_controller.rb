class Author::BooksController < Author::BaseController
  def index
    @books = Book.paginate(:order => " id DESC",:page  => params[:page])
  end
  
  
  def show
    @book = Book.find(params[:id])
    @sections = Section.where("book_id = ?",@book.id)
  end
  
  
  def new
    @book = Book.new
    @catetories = Category.where(" parent_id > 0"  ).order("sequence asc").collect { |item| [item.parent.title + ' -> ' +item.title,item.id] }
  end
  
  
  def create
    @book = Book.new(params[:book])
    @book.user_id = current_user.id
    if @book.save
      redirect_to author_book_path(@book)
    else
      flash[:notice] = "Created failed."
      redirect_to :back
    end
  end
  
  
  def edit
    @book = Book.find(params[:id])
    @catetories = Category.where(" parent_id > 0"  ).order("sequence asc").collect { |item| [item.parent.title + ' -> ' +item.title,item.id] }
  end
  
  
  def update
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      flash[:notice] = "Not yourself book."
      redirect_to :back  and return
    end
    
    if @book.update_attributes(params[:book])
      redirect_to author_book_path(@book) 
    else
      flash[:notice] = "Updated failed."
      redirect_to :back
    end
  end
  
  
  def destroy
    @book = Book.find(params[:id])
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
