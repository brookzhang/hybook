module ApplicationHelper
  def title
    base_title = "hybook"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("logo.gif",:alt=>"Sample App" , :class=>"round")
  end
  
  def navigation_bar
    link = [link_to('Home',root_path,:class=>"deepblue")]
    link << link_to('Toplist' ,'/toplist',:class=>"deepblue")
    @categories = Category.where([" (parent_id=0 or parent_id is null) and show_on_header = ? ",true]).all()
    #@categories = Category.all()
    @categories.each do |cat|
      link << link_to(cat.title , cat,:class=>"deepblue")
    end
    
    if signed_in?
      link << link_to('myinfo' ,'/maintain/dashboard',:class=>"deepblue")
      link << link_to('Logout' ,'signout_path', :method =>:delete,:class=>"deepblue")
    else
      link << link_to('Login' ,signin_path,:class=>"deepblue")
    end
    
    
    link.join(" &nbsp; ").html_safe
  end
  
end
