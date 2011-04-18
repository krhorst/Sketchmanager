class PagesController < ApplicationController
  
  skip_before_filter :authenticate

  def about
    @title = "About"
  end

  def home
    if signed_in?
      redirect_to groups_path
    else
      @title = "Home"  
    end
  end  

  def contact
    @title = "Contact"
  end
    
end
