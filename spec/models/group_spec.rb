require 'spec_helper'

describe Group do
  
  before (:each) do
    @attr = { 
          :name => 'Test Group'
              }  
  end
  
  it "should create a group given valid attributes" do
    Group.create!(@attr)
  end
  
  describe "name validations" do
  
    it "should require a name" do 
      no_name_group = Group.new(@attr.merge(:name => ''))
      no_name_group.should_not be_valid
    end
  
    it "should reject names that are too short" do
        short_name = "a" * 3
        short_name_group = Group.new(@attr.merge(:name => short_name))
        short_name_group.should_not be_valid
    end

    it "should reject long names" do
        long_name = "a" * 81
        long_name_group = Group.new(@attr.merge(:name => long_name))  
        long_name_group.should_not be_valid                                  
    end
  
  end
  
end
