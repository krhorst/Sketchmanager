class ScenesController < ApplicationController
  
  before_filter :check_group, :only => [:new, :create, :index]
  
  def new
    @title = "New Scene"
    @scene = Group.find(params[:group_id]).scenes.new
  end
  
  def create
    @scene = Group.find(params[:scene][:group_id]).scenes.create(params[:scene])      

    if @scene.save
      flash[:success] = "Scene successfully created"
      redirect_to @scene
    else
      @title = "New Scene"
      render 'new'
    end
    
  end

  def index
    @group = Group.find(params[:group_id], :include => :scenes)
  end

  def show
    if Scene.exists?(params[:id])
      @scene = Scene.find(params[:id])
      @title = "Scene Details - " + @scene.name
    else
      flash[:no_scene] = "Scene not found"
      redirect_to groups_path
    end  
  end
  
private

  def check_group
    if !Group.exists?(params[:group_id]) 
      flash[:no_group] = "Group Not found"
      redirect_to groups_path
    end
  end
  
end
