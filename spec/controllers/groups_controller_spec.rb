require 'spec_helper'

describe GroupsController do
render_views

  describe "for Signed-in Users" do
  
    before(:each) do
        @user = test_sign_in(Factory(:user))
    end
  
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
      
        it "should not create a membership" do
          lambda do
            post :create, :group => @attr
          end.should_not change(Membership, :count)
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
    
        it "should create a membership" do
          lambda do
            post :create, :group => @attr
          end.should change(Membership,:count).by(1)
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
      
    
      it "should have the right title" do
          get :edit, :id => @group
          response.should have_selector('title', :content => "Edit Group")
        end
    
      it "should be successful" do
          get :edit, :id => @group
          response.should be_success
        end
      
    
  end

    describe "PUT update" do
      
       before(:each) do
          @group = Factory(:group)
        end

        describe "failure" do

          before(:each) do
            @attr = { :name => "" }
          end

          it "should render the edit page" do
            put :update, :id => @group, :group => @attr
            response.should render_template('edit')
          end

          it "should have the right title" do
            put :update, :id => @group, :group => @attr
            response.should have_selector("title", :content => "Edit Group")

          end

        end

        describe "success" do

          before(:each) do
            @attr = { 
                      :name => "New Name"
                    }
          end

          it "should change the user's attributes" do
            put :update, :id => @group, :group => @attr
            @group.reload
            @group.name.should == @attr[:name]
          end

          it "should redirect to the group show page" do
            put :update, :id => @group, :group => @attr
            @group.reload
            response.should redirect_to(group_path(@group))
          end

          it "should have a flash message" do
            put :update, :id => @group, :group => @attr
            flash[:success].should =~ /updated/i
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

      
        before(:each) do
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

  describe "for non-signed in users" do
    
    before (:each) do
      @attr = { :name => "Test Group" }
      @group = Factory(:group)
    end
    
    it "should deny access to new" do
      get :new
      response.should redirect_to(signin_path)
    end
      
    it "should deny access to create" do
      post :create, :group => @attr
      response.should redirect_to(signin_path)
    end
      
      it "should deny access to index" do
        get :index
        response.should redirect_to(signin_path)
      end

      it "should deny access to edit" do
        get :edit, :id => @group
        response.should redirect_to(signin_path)
      end
      
      it "should deny access to update" do
        put :update, :id => @group, :group => @attr
        response.should redirect_to(signin_path)
      end
  end

end