class ScenesController < ApplicationController
  
  before_filter :check_group, :only => [:new, :create, :index]
  before_filter :get_groups
  
  def new
    @title = "New Scene"
    @scene = Group.find(params[:group_id]).scenes.new
  end
  
  def create
    @scene = Scene.create(params[:scene])      

    if @scene.save
      redirect_to @scene, :flash => { :success => "Scene successfully created" }
    else
      @title = "New Scene"
      render :new
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
      redirect_to groups_path :flash => { :no_scene => "Scene not found"}
    end  
  end
  
  def edit
    if Scene.exists?(params[:id])
      @scene = Scene.find(params[:id])
      @title = "Edit Scene"
    else
      redirect_to groups_path :flash => { :no_scene => "Scene not found" }
    end
  end
  
  
private

  def check_group
    if !Group.exists?(params[:group_id]) 
      redirect_to groups_path, :flash => { :no_group => "Group Not found" }
    end
  end
  
end
