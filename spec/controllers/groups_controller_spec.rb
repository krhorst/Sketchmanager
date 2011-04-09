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
    
    before (:each) do
      @group = Factory(:group)
    end
    
    describe "not signed in" do
      
      it "should redirect to login page" do
        get :edit, :id => @group
        response.should redirect_to(signin_path)
      end
    end
    
    describe "signed in" do
      
      before(:each) do
        @user = test_sign_in(Factory(:user))
      end
      
      it "should have the right title" do
        get :edit, :id => @group
        response.should have_selector('title', :content => "Edit Group")
      end
      
      it "should be successful" do
        get :edit, :id => @group
        response.should be_success
      end
    end
    
  end

  describe "GET 'show'" do
    
    before(:each) do
      @group = Factory(:group)
    end
    
    it "should be successful" do
      get :show, :id => @group
      response.should be_success
    end
    
    it "should find the right group" do
      get :show, :id => @group
      assigns(:group).should == @group
    end
    
  end

  describe "GET 'index'" do
    
    describe "for non-signed-in users" do
      
      it "should redirect to login page" do
        get :index
        response.should redirect_to(signin_path)
      end
        
    end
    
    describe "for signed-in users" do
      
      before(:each) do
        @user = test_sign_in(Factory(:user))
        group_one = Factory(:group, :name => "First Group")
        group_two = Factory(:group, :name => "Second Group")
        group_three = Factory(:group, :name => "Third Group")
        @groups = [group_one, group_two, group_three]
      end
      
      it "should be successful" do
        get :index
        response.should be_success
      end
      
      it "should have the right title" do
        get :index
        response.should have_selector('title', :content => "All Groups")
      end
      
      it "should have an element for each user" do
        get :index
        @groups.each do |g|
          response.should have_selector('li', :content => g.name)
        end
      end
      
    end

  end

end