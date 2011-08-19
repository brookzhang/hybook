class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  def categories_list
    @categories = Category.where(:show_on_header=> true).all
    @link_list =''
    @categories.each do |c|
      @link_list += link_to(c.title,c_path) + ' '
    end
    
  end
end
