require 'spec_helper'

describe Scene do

  before(:each) do
    @attr = { 
              :name => 'Scene Name',
              :description => 'This is the scene description'
            }
    @group = Factory(:group)
  end
  
  it "should create a new scene given valid attributes" do
    @group.scenes.create!(@attr)
  end

  describe "name validations" do

    it "should not allow a scene with an empty name" do
      no_name_scene = @group.scenes.new(@attr.merge(:name => ""))
      no_name_scene.should_not be_valid
    end

    it "should not allow a scene with a short name" do
      short_name = "a" * 2;
      short_name_scene = @group.scenes.new(@attr.merge(:name => short_name))
      short_name_scene.should_not be_valid
    end
    
    it "should not allow a scene with a long name" do
      long_name = "a" * 61;
      long_name_scene = @group.scenes.new(@attr.merge(:name => long_name))
      long_name_scene.should_not be_valid
    end
    
  end
  
  describe "description validations" do
    
    it "should not allow a scene without a description" do
      no_description_scene = @group.scenes.new(@attr.merge(:description => ""))
      no_description_scene.should_not be_valid
    end
    
  end
  
end
