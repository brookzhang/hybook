class CategoriesController < ApplicationController
  def index
    @categories = Category.paginate(:page=>params[:page])
  end

  def header_menu
    @categories = Category.where(:show_on_header=> true).all
    @link_list =''
    @categories.each do |c|
      @link_list += link_to(c.title,c_path) + ' '
    end
  end
  
end
