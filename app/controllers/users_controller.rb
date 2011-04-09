class UsersController < ApplicationController
  
  before_filter :authenticate, :only => [:edit, :update]
  
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
      flash[:success] = "Welcome to Sketchmanager"
      sign_in(@user)
      redirect_to @user
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
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit User"
      render 'edit'
    end
    
  end
  
end
