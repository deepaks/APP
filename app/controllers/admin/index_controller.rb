class Admin::IndexController < ApplicationController
  before_filter :require_account_member, :only => [:secret, :dashboard]
  before_filter :require_sys_admin, :only => [:topsecret,:sysadmin]
  
  def index
    unless is_main_site?
      redirect_to dashboard_path
    else
      redirect_to sysadmin_path
    end
  end
  
  def dashboard
    if is_main_site?
      redirect_to sysadmin_path
    else
      #stay
    end
  end
  
  def main
  end
  
  def sysadmin
    @account_domain = account_domain
    @account_subdomain = account_subdomain
    @account = current_account
  
    if !current_user.nil? and current_user.registrations.size > 0
      @user_registrations = current_user.registrations
    end
  end
  
  def secret
  end
  
  def topsecret
  end
  
end