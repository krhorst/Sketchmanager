class UsersController < ApplicationController
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
      redirect_to @user
    else
      @title = "Sign Up"
      render 'new'  
    end  
  end
end
