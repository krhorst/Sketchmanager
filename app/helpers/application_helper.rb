module ApplicationHelper
  
  def title
    base_title = "Sketchmanager"
    
    if @title.nil?
      return base_title
    else
      return "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("logo.png", :alt => "Sketchmanager.com", :class => "round")
  end
end
