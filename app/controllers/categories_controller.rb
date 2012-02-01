class CategoriesController < ApplicationController
  def index
    @categories = Category.all()
  end

  def show
    @category = Category.find(params[:id])
    @parent_category = Category.find(@category.parent_id>0 ? @category.parent_id : params[:id])
    @groups =  Category.where([" parent_id = ?",@parent_category.id]).all()
    @books = @category.parent_id==0 ? Book.where("category_id in (?)",@groups.collect{|c| c.id.to_s}).order("all_click desc") : Book.where("category_id = ?",@category.id)
  end

  def top_list
    @categories = Category.all()
  end
end
