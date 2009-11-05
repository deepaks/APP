class IndexController < ApplicationController
  layout :check_layout
  before_filter :check_access, :only => [:index, :main]
  
  def index
    @posts = current_account.posts
    @pictures = current_account.featured_pictures
  end
  
  def main
    @projects = Project.find(:all, :limit => 9)
  end
  
  def list_members
    if is_main_site? # main site requires sys admin
      @users = User.all
    else # firm site requires account member
      @user = current_account.users
      @users = User.find(:all,:conditions => ['user_type_id = ?', 3 ])
    end
  end
  
  def list_clients
    if is_main_site? # main site requires sys admin
      @users = User.all
    else # firm site requires account member
      @user = current_account.users
      @users = User.find(:all,:conditions => ['user_type_id = ?', 4 ])
    end
  end
  private
  
  def check_layout
    is_main_site? ? "app_frontend" : "firm_frontend"
  end
  
  def check_access
    if is_main_site?
      redirect_to app_root_path unless params[:action] == "main"
    else
      redirect_to root_path unless params[:action] == "index"
    end
  end
  
end
