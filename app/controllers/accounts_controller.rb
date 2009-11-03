class AccountsController < ApplicationController
  before_filter :require_sys_admin, :only => [:index]
  layout :current_account_layout
  
  def conditions_for_collection
    ['accounts.id <> ?', 0]
  end
  
  # def index
  #   @accounts = Account.find(:all, :conditions => "id <> 0")
  # end
  
  def show
    @account = Account.find(params[:id])
    @address = @account.address
  end
  
  def new
    @account = Account.new
    #@order   = Order.new
    @user    = User.new
  end
  
  def create
    @account = Account.new(params[:account])
		@registration = @account.registrations.build({:role_id => Role.name_equals('account_owner').first.id})
    @registration.user = User.new(params[:user])
    if @account.save
  		flash[:notice] = "Successfully created account."
      redirect_to account_url(@account.domain_name) + url_for(dashboard_path)
      #redirect_to dashboard_path
    else
      render :action => 'new'
    end
  end
  

  def edit
    @account = Account.find(params[:id])
  end
  
  def update
    @account = Account.find(params[:id])
		if @account.update_attributes(params[:account]) && @account.address.update_attributes(params[:address])
      flash[:notice] = "Successfully updated account."
      redirect_to dashboard_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    flash[:notice] = "Successfully destroyed account."
    redirect_to accounts_url
  end
  
protected

  def current_account_layout
    if is_main_site?
      current_frontend_layout_name
    else
      current_backend_layout_name
    end
  end
  
end
