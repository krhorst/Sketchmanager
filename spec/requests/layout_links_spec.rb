require 'spec_helper'

describe "LayoutLinks" do

  it "should have a home page at '/'" do
    get '/'
    response.should have_selector('title', :content => 'Home')
  end
  
  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => 'Contact')
  end
 
  it "should have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => 'About')
  end

  it "should have a Signup page at '/signup" do
    get '/signup'
    response.should have_selector('title', :content => 'Sign Up')
  end
  
  it "should have the right links in the layout" do
    visit root_path
  
    click_link "About"
    response.should have_selector('title', :content => "About")
    
    click_link "Contact"
    response.should have_selector('title', :content => "Contact")
    
    click_link "Home"
    response.should have_selector('title', :content => "Home")
    
  end

  describe "when not signed in" do
    it "should have a signin link" do
      visit root_path
      response.should have_selector("a", :href => signin_path, :content => "Sign In")
    end
    
  end

  describe "when signed in" do
    
    before (:each) do
      @user = Factory(:user)
      visit signin_path
      fill_in :email, :with => @user.email
      fill_in :password, :with => @user.password
      click_button
    end
    
    it "should have a settings link" do
      visit root_path
      response.should have_selector("a", :href => edit_user_path(@user), :content => "Settings")
    end
    
    it "should display the sidebar" do
      visit root_path
      response.should have_selector("aside#sidebar")
    end
    
  end
  
  
  
end