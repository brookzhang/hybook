class Maintain::CategoriesController < Maintain::BaseController
  def index
    @categories = Category.paginate(:page=>params[:page])
  end

  def show
  end

  def edit
    @category = Category.find(params[:id])
  end
  
  def save
    
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      #flash[:success] = "Profile updated."
      redirect_to :action => :index
    else
      redirect_to :back
    end
  end
end
