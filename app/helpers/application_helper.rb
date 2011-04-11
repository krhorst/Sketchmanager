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
  
  def sidebar
    stri = ''
    Groups.find(:all).each do |g|
      stri += "<h3>" + g.name + "</h3>"
      stri += "<ul>"
      stri += "<li>" + scenes_path(g) + "</li>"
      stri += "</li>"
    end
    return stri
  end
  
end
