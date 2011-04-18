require 'spec_helper'

describe "Groups" do

  describe "create group" do

    before(:each) do
      integration_sign_in(Factory(:user))
    end
  
    describe 'failure' do
    
      it 'should not create a group' do
        lambda do
          visit new_group_path
          fill_in :name, :with => ""
          click_button
          response.should have_selector('div#error_explanation')
          response.should render_template('groups/new')
        end.should_not change(Group,:count)
      end
    end

    describe 'success' do
      it 'should create a group' do
        lambda do
          visit new_group_path
          fill_in :name, :with => "Test Name"
          click_button
          response.should have_selector('div.flash.success', :content => 'Group successfully created')
          response.should render_template('groups/show')
        end.should change(Group, :count).by(1)
      end
    end
  
  end

  describe "Groups Index" do
    
    before(:each) do
      integration_sign_in(Factory(:user))
    end
    
    it "should have a link to create a group" do
      visit groups_path
      click_link "Add Group"
      response.should render_template('groups/new')
    end
    
  end
  
  describe "Show Group" do
    
    before(:each) do
      integration_sign_in(Factory(:user))
      @group = Factory(:group)
    end
    
    it "should have a link to edit the group" do
      visit group_path(@group)
      click_link "Edit"
      response.should render_template('groups/edit')
    end
    
  end

end
