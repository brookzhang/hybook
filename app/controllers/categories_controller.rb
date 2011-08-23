class CategoriesController < ApplicationController
  def index
    @categories = Category.paginate(:page=>params[:page])
  end

  def show
    @category = Category.find(params[:id])
    @parent_category = Category.find(@category.parent_id>0 ? @category.parent_id : params[:id])
    @groups =  Category.where([" parent_id = ?",@parent_category.id]).all()
  end

end
