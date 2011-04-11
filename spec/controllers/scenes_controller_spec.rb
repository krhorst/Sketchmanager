require 'spec_helper'

describe ScenesController do
render_views

  describe "For signed-in users" do

    before (:each) do
        @user = test_sign_in(Factory(:user))   
        @group = Factory(:group)
    end

    describe "GET 'new'" do
    

    
      describe "group exists" do
        it "should be successful" do
          get 'new', :group_id => @group
          response.should be_success
        end
    
        it "should have the right title" do
          get 'new', :group_id => @group
          response.should have_selector("title", :content => "New Scene")
        end
    
      end
    
      describe "Group does not exist" do
        
        it "should redirect to groups index" do
          get 'new', :group_id => -1
          response.should redirect_to(groups_path)
        end
        
      end
    
      describe "No Group specified" do
        
        it "should redirecto to groups index" do
          get 'new', :group_id => ''
          response.should redirect_to(groups_path)
        end
        
      end
    
    end

    describe "POST 'create'" do
      
      describe 'failure' do
        
        before (:each) do
          @attr = { :name => '', :description => '' }
        end
        
        it "should not create a scene" do
          
          lambda do
            post 'create', :scene => @attr, :group_id => @group
          end.should_not change(Scene,:count)
          
        end
        
        it "should have the right title"
        
        it "should render the 'new scene' page"
        
      end
      
      describe 'success'
      
    end

  end

end
