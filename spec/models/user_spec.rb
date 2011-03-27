require 'spec_helper'

describe User do

  before(:each) do
    @attr = { 
      :name => "This User", 
      :email => "email@test.com",
      :password => "foobar",
      :password_confirmation => "foobar"
      }
  end

  it "should create a new user given valid attributes" do
    User.create!(@attr)
  end

  describe "name validations" do

    it "should require a name" do
      no_name_user = User.new(@attr.merge(:name => ''))
      no_name_user.should_not be_valid
    end
  
    it "should reject a name that is too long" do
      long_name = "a" * 51
      long_name_user = User.new(@attr.merge(:name => long_name))
      long_name_user.should_not be_valid
    end
  
  end
  
  describe "email validations" do
    it "should require an email" do
      no_email_user = User.new(@attr.merge(:email => ''))
      no_email_user.should_not be_valid
    end
  
    it "should accept valid email addressses" do
      addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
      addresses.each do |address|
        valid_email_user = User.new(@attr.merge(:email => address))
        valid_email_user.should be_valid
      end
    end  
  
    it "should reject invalid email addressses" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |address|
        invalid_email_user = User.new(@attr.merge(:email => address))
        invalid_email_user.should_not be_valid
      end
    end
  
    it "should reject a duplicate email address" do
      User.create!(@attr)
      user_with_duplicate_email = User.new(@attr)
      user_with_duplicate_email.should_not be_valid
    end
  
    it "should reject emails that are identical up to case" do
      upcased_email = @attr[:email].upcase
      User.create(@attr.merge(:email => upcased_email))
      user_with_duplicate_email = User.new(@attr)
      user_with_duplicate_email.should_not be_valid
    end
  
  end

  describe "password validations" do
    
      it "should require a password" do
        no_password_user = User.new(@attr.merge(:password => "", :password_confirmation => ""))
        no_password_user.should_not be_valid
      end

      it "should require a matching password confirmation" do
        not_matching_user = User.new(@attr.merge(:password_confirmation => "invalid"))
        not_matching_user.should_not be_valid
      end  
      
      it "should reject short passwords" do
        short_password = "a" * 5
        short_password_user = User.new(@attr.merge(:password => short_password, :password_confirmation => short_password))
        short_password_user.should_not be_valid
      end
    
      it "should reject long passwords" do
        long_password = "a" * 41
        long_password_user = User.new(@attr.merge(:password => long_password, :password_confirmation => long_password))
        long_password_user.should_not be_valid
    
      end
  end
   
  describe "password encryption" do
    before(:each) do
      @user = User.create!(@attr)
    end  
      
    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end
   
   it "should set the encrypted password" do
    @user.encrypted_password.should_not be_blank
   end 
   
    describe "has_password? method" do
      
      it "should be true if the passwords match" do
        @user.has_password?(@attr[:password]).should be_true
      end
      
      it "should be false if the passwords don't match" do
        @user.has_password?('invalid').should be_false
      end
      
    end

  end  
  
  describe "authentication" do
    it "should return nil on email / password mismatch" do
      wrong_password_user = User.authenticate(@attr[:email],'invalid')
      wrong_password_user.should be_nil
    end
    
    it "should return nil for an email address with no user" do
        nonexistent_user = User.authenticate("nonexistent@email.com", @attr[:password])
    end  
    
    it "should return the user on email / password match" do
      matching_user = User.authenticate(@attr[:email],@attr[:password])
      matching_user.should == @user
    end
  end  
  
end
