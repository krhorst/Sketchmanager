require 'spec_helper'

describe GroupsController do
render_views

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'new'
      response.should have_selector('title', :content => "New Group")
    end
    
  end

  describe "POST 'create'" do
  
    describe "failure" do
      
      before (:each) do
          @attr = { :name => "" }
      end
      
      it "should not create a group" do
        lambda do
          post :create, :group => @attr
        end.should_not change(Group, :count)
      end
      
      it "should have the right title" do
        post :create, :group => @attr
        response.should have_selector("title", :content => "New Group")
      end
      
      it "should render the 'new group' page" do
        post :create, :group => @attr
        response.should render_template('new')
      end
      
    end
    
    describe "success" do
    
      before (:each) do
      @attr = {:name => "Test Group"}
    end
    
      it "should create a group" do
      lambda do
        post :create, :group => @attr
      end.should change(Group,:count).by(1)
    end
    
      it "should redirect to the group page" do
      post :create, :group => @attr
      response.should redirect_to(group_path(assigns(:group)))
    end
  
    end

  end  

  describe "GET 'edit'" do

  end

  describe "GET 'update'" do
    
  end

  describe "GET 'destroy'" do
  
  end

  describe "GET 'index'" do

  end

end
