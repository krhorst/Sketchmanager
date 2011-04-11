class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  before_filter :get_groups

  def authenticate
    deny_access unless signed_in?
  end
  
  def get_groups
    if signed_in?
      @groups = Group.find(:all)
    end
  end

end
