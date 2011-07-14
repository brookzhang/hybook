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
  
end
