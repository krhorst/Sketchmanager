require 'spec_helper'

describe "Groups" do

  describe "create group" do
  
    describe 'failure' do
    
      it 'should not create a group' do
        lambda do
          visit new_group_path
          fill_in "Name", :with => ""
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
          fill_in "Name", :with => "Test Name"
          click_button
          response.should have_selector('div.flash.success', :content => 'Group successfully created')
          response.should render_template('groups/show')
        end.should change(Group, :count).by(1)
      end
    end
  
  end
end
