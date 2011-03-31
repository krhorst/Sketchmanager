class GroupsController < ApplicationController
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
    
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
  end

end
