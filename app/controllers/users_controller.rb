class UsersController < ApplicationController 
	before_filter :require_firm_site, :only => [:new, :create, :edit, :update]
	layout :check_layout,:only => [:new]
	layout :current_backend_layout_name, :except => [:list]
        
          
  #before_filter :require_account_owner, :only => [:new, :create]
  def new
    @user = User.new
    @account = Account.new
    @order = Order.new
		begin
     @service_plan = ServicePlan.find(params[:service_plan])
		rescue
	   @service_plan = nil
	  end
  end
  
   def create
     @user = User.new(params[:user])
  # 		
     if @user.save
       reg = Registration.new
       reg.user = @user
  #     
     if is_main_site?
         # on the main site, create new account/subdomain for the user
         @account = Account.new(params[:account])
         @order = Order.new(params[:order])
         @account.save
         reg.role = Role.name_equals('account_owner').first
       else
  #       # current account present, user is a member
         @account = current_account
         reg.role = Role.name_equals('account_member').first
       end
  # 
       reg.account = @account
       @user.registrations << reg
  #     
       if is_main_site?
         #flash[:notice] = @account.domain_name + ".app.local successfully created"
         redirect_to account_url(@account.domain_name)
       else
         flash[:notice] = "Successfully registered."
  #       
         if current_user.nil?
           redirect_to root_url
         else
           redirect_to :controller => "index", :action => "index"
         end
       end
     else
   		@account = Account.new
   	    @order = Order.new
       render :action => 'new'
     end
   end
  
  
	 


  def edit
    if params[:id] == "current"
      @user = current_user
    else
      @user = User.find(params[:id])
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Profile successfully saved"
      redirect_to edit_user_url(:current)
    else
      render :action => 'edit'
    end
  end
  
  def show
    if params[:id] == "current"
      @user = current_user
    else
      @user = User.find(params[:id])
    end
  end
  
  def list
    if is_main_site? # main site requires sys admin
      @users = User.all
    else # firm site requires account member
      @users = current_account.users
    end
  end

#Twitter Temp!
# def authorize_twitter_account
#   oauth = current_user.oauth
#   session[:rtoken] = oauth.request_token.token
#   session[:rsecret] = oauth.request_token.secret
#   puts session[:rtoken]
#   puts session[:rsecret]
#   redirect_to oauth.request_token.authorize_url 
# end
# 
# def twitter_callback
#   oauth = current_user.oauth
#   oauth.authorize_from_request(session[:rtoken], session[:rsecret])
# 
#   current_user.update_attributes({  :twitter_token => oauth.access_token.token,
#                                     :twitter_secret => oauth.access_token.secret })
#   current_user.save!
#   session[:rtoken] = nil
#   session[:rsecret] = nil
#   redirect_to :action => "edit", :id => current_user.id
# 
#  rescue OAuth::Unauthorized
#    # TODO: for some reason the authorization fails sometimes... this is to catch those instances
#    puts session[:rtoken]
#    puts session[:rsecret]
#    redirect_to :action => "edit", :id => current_user.id
# end
# 
# def unauthorize_twitter_account
#   current_user.remove_twitter_info
#   redirect_to :action => "edit", :id => current_user.id
# end
private
  
  def check_layout
    is_main_site? ? "app_frontend" : "firm_frontend"
  end
end
