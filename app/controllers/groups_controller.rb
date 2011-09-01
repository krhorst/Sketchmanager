class GroupsController < ApplicationController
  
  def new
    @title = "New Group"
    @group = Group.new
    @user_id = current_user.id
  end

  def create
    @group = Group.create(params[:group])
    
    if @group.save
      redirect_to @group, :flash =>{ :success => "Group successfully created" }
    else
      @title = "New Group"
      render :new
    end
  
  end

  def show
    @group = Group.find(params[:id])
    @title = "Group Details - " + @group.name
  end

  def edit
    @title = "Edit Group"
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if (@group.update_attributes(params[:group]))
      redirect_to @group, :flash => { :success => "Group updated." }
    else
      @title = "Edit Group"
      render 'edit'
    end
  end

  def index
    @title = "All Groups"
    @groups = Group.find(:all)
  end

end
