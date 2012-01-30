class Maintain::CategoriesController < Maintain::BaseController
  def index
    @categories = Category.paginate(:page=>params[:page])
  end

  def show
  end

  def edit
    @category = Category.find(params[:id])
    @parents = Category.where(:parent_id=> 0 ).order("sequence asc").collect { |item| [item.title,item.id] }.insert(0, ['--root--',0]) 
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      #flash[:success] = "Updated successfully."
      redirect_to :action => :index
    else
      render :action=>:edit
    end
  end
  
  def new
    @category = Category.new
    #@parents = Category.where(:parent_id=> 0 ).order("sequence asc")
    @parents = Category.where(:parent_id=> 0 ).order("sequence asc").collect { |item| [item.title,item.id] }.insert(0, ['--root--',0])  
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
