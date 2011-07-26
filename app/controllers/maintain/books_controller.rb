class Maintain::BooksController < Maintain::BaseController
  before_filter :find_book, :only => [:show, :update, :destroy]

  def index
    respond_to do |format|
      format.html {
        @books = Book.paginate(
          :order => "published_at DESC",
          :page  => params[:page]
        )
      }
    end
  end

  def create
    @book = Book.new(params[:book])
    if @book.save
      respond_to do |format|
        format.html {
          flash[:notice] = "Created book '#{@book.title}'"
          redirect_to(:action => 'show', :id => @book)
        }
      end
    else
#      respond_to do |format|
#        format.html { render :action => 'new',         :status => :unprocessable_entity }
#      end
#    @book1 = Book.build_for_preview(params[:book])

    respond_to do |format|
      format.js {
        render :partial => 'books/book.html.erb', :locals => {:book => @book}
      }
    end
    end
  end

  def update
    if @book.update_attributes(params[:book])
      respond_to do |format|
        format.html {
          flash[:notice] = "Updated book '#{@book.title}'"
          redirect_to(:action => 'show', :id => @book)
        }
      end
    else
      respond_to do |format|
        format.html { render :action => 'show',        :status => :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |format|
      format.html {
        render :partial => 'book', :locals => {:book => @book} if request.xhr?
      }
    end
  end

  def new
    @book = Book.new
  end

  def preview
    @book = Book.build_for_preview(params[:book])

    respond_to do |format|
      format.js {
        render :partial => 'books/Book.html.erb', :locals => {:book => @book}
      }
    end
  end

  def destroy
    undo_item = @book.destroy_with_undo

    respond_to do |format|
      format.html do
        flash[:notice] = "Deleted book '#{@book.title}'"
        redirect_to :action => 'index'
      end
      format.json {
        render :json => {
          :undo_path    => undo_admin_undo_item_path(undo_item),
          :undo_message => undo_item.description,
          :book         => @book.attributes
        }
      }
    end
  end

  protected

  def find_post
    @book = Book.find(params[:id])
  end
end
