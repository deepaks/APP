# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include SubdomainAccounts
  include AuthenticatedSystem
  layout :current_backend_layout_name

  before_filter :check_account_status

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  helper_method :current_user, :account_host

private

def account_host( subdomain )
	account_host = ''
	account_host << subdomain + '.'
	account_host << account_domain
end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to signup_path
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to root_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

protected

  def check_account_status
    @current_account = current_account 
    unless account_subdomain == default_account_subdomain
      # TODO: this is where we could check to see if the account is active as well (paid, etc...)
      redirect_to default_account_url if current_account.nil? 
    end
  end
  
  def require_firm_site
    if is_main_site?
      redirect_to default_account_url
    end
  end
  
  def require_account_owner
    unless current_user && (is_main_site? || current_account.owner == current_user)
      store_location
      flash[:notice] = "Only the account owner of " + current_account.domain_name + ".app.local can access this page"
      redirect_to login_url
      return false
    end
  end
  
  def require_account_member
    unless current_user && (is_main_site? || current_account.users.include?(current_user))
      store_location
      flash[:notice] = "Only the account member of " + current_account.domain_name + ".app.local can access this page"
      redirect_to login_url
      return false
    end
  end
  
  def require_sys_admin
    unless current_user && current_user.has_role?("sys_admin")
      store_location
      flash[:notice] = "SYS ADMIN ONLY"
      redirect_to account_url + url_for({:controller => "/user_sessions", :action => :new, :only_path => true})
      return false
    end
  end

  def is_main_site?
    account_subdomain == default_account_subdomain
  end
  
  def current_backend_layout_name
    is_main_site? ? "app_backend" : "firm_backend"
  end

	def current_frontend_layout_name
    is_main_site? ? "app_frontend" : "firm_frontend"
  end
end
