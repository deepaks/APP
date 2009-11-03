class PortfoliosController < ApplicationController
  
  before_filter :require_firm_site, :only => [:new, :create, :edit, :update]
  
  def index
    if is_main_site?
      @portfolios = Portfolio.all
    else
      @portfolios = current_account.portfolios
    end
  end
  
  def view
    @portfolio = Portfolio.find(params[:id])
    render :action => "view", :layout => "firm_frontend"
  end
  
  def show
    @portfolio = Portfolio.find(params[:id])
  end
  
  def new
    @portfolio = Portfolio.new
    @projects = current_account.projects
  end
  
  def create
    @portfolio = Portfolio.new(params[:portfolio])
    @portfolio.account = current_account
    if @portfolio.save
      flash[:notice] = "Successfully created portfolio."
      redirect_to @portfolio
    else
      render :action => 'new'
    end
  end
  
  def edit
    @portfolio = Portfolio.find(params[:id])
    @projects = current_account.projects
  end
  
  def update
    @portfolio = Portfolio.find(params[:id])
    #@portfolio.account = current_account
    if @portfolio.update_attributes(params[:portfolio])
      flash[:notice] = "Successfully updated portfolio."
      redirect_to @portfolio
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy
    flash[:notice] = "Successfully destroyed portfolio."
    redirect_to portfolios_url
  end
end
