class UsersController < ApplicationController
  
  skip_before_filter :authenticate, :only => [:new, :create]
  
  def new
    @user = User.new
    @title = "Sign Up"
  end
    
  def show
    @user = User.find(params[:id])
  end    
  
  def create
    @user = User.create(params[:user])
    if @user.save
      sign_in(@user)
      redirect_to @user, :flash => { :success => "Welcome to Sketchmanager" }
    else
      @title = "Sign Up"
      render 'new'  
    end  
  end

  def edit
    @title = "Edit User"
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if (@user.update_attributes(params[:user]))
      redirect_to @user, :flash => { :success => "Profile updated." }
    else
      @title = "Edit User"
      render 'edit'
    end
  end
  
end
