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