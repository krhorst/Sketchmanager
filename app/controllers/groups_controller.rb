class GroupsController < ApplicationController
  
  before_filter :authenticate, :only => [:index, :edit]
  
  def new
    @title = "New Group"
    @group = Group.new
  end

  def create
    @group = Group.create(params[:group])
    
    if @group.save
      flash[:success] = "Group successfully created"
      redirect_to @group
    else
      @title = "New Group"
      render 'new'
    end
  
  end

  def show
    @group = Group.find(params[:id])
    @title = "Group Details - " + @group.name
  end

  def edit
    @title = "Edit Group"
  end

  def update
  end

  def destroy
  end

  def index
    @title = "All Groups"
    @groups = Group.all
  end

end
