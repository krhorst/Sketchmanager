require 'spec_helper'

describe Membership do

  before(:each) do
    @user = Factory(:user)
    @group = Factory(:group)
    @attr = { :user_id => @user, :group_id => @group, :level => 1 }
  end
  
  it "should create a membership given valid attributes" do
    Membership.create!(@attr)
  end

  it "should not allow duplicate membership entries" do
    Membership.create!(@attr)
    duplicate_membership = Membership.new(@attr)
    duplicate_membership.should_not be_valid
  end
  
  it "should not allow a membership without a user" do
    no_user_membership = Membership.new(@attr.merge(:user_id => ''))
    no_user_membership.should_not be_valid
  end

  it "should not allow a membership without a group" do
    no_group_membership = Membership.new(@attr.merge(:group_id => ''))
    no_group_membership.should_not be_valid
  end

end
