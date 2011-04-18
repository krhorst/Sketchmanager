require 'spec_helper'

describe "Scenes" do

  before(:each) do
    integration_sign_in(Factory(:user))
    @group = Factory(:group)
  end

  describe "create scene" do
  
    describe 'failure' do
    
      it 'should not create a scene' do
        lambda do
          visit new_group_scene_path(:group_id => @group)
          fill_in :name, :with => ""
          fill_in :description, :with => ""
          click_button
          response.should have_selector('div#error_explanation')
          response.should render_template('scenes/new')
        end.should_not change(Scene,:count)
      end
    end

    describe 'success' do
      it 'should create a scene' do
        lambda do
          visit new_group_scene_path(:group_id => @group)
          fill_in :name, :with => "Test Name"
          fill_in :description, :with => "This is the details of the scene"
          click_button
          response.should have_selector('div.flash.success', :content => 'Scene successfully created')
          response.should render_template('scenes/show')
        end.should change(Scene, :count).by(1)
      end
    end
  
  end

  describe "Scenes Index" do
    
    it "should have a link to create a scene" do
      visit group_scenes_path(:group_id => @group)
      click_link "Add a Scene"
      response.should render_template('scenes/new')
    end
    
  end

  describe "Show Scene" do
    
    before(:each) do
      @scene = Factory(:scene)
    end
    
    it "should have a link to edit the scene" do
      visit scene_path(@scene)
      click_link "Edit"
      response.should render_template('scenes/edit')
    end
  end

end
