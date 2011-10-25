class CategoriesController < ApplicationController
  def index
    @categories = Category.all()
  end

  def show
    @category = Category.find(params[:id])
    @parent_category = Category.find(@category.parent_id>0 ? @category.parent_id : params[:id])
    @groups =  Category.where([" parent_id = ?",@parent_category.id]).all()
  end

  def top_list
    @categories = Category.all()
  end
end
