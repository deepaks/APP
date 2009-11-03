class PlaintextsController < ApplicationController
  before_filter :require_firm_site, :only => [:new, :create, :edit, :update]
  
  def index
    @plaintexts = Plaintext.all
  end
  
  def show
    @plaintext = Plaintext.find(params[:id])
  end
  
  def new
    @plaintext = Plaintext.new
    
    # # for now
    # @plaintext.post_part = PostPart.new
    # @plaintext.post_part.post = Post.new
    
    @projects = current_account.projects
  end
  
  def create
    @one = Plaintext.new(params[:plaintext])
    @one.account = current_account
    
    if @one.save
      
      @post_part = @one.add_to_post(params[:post][:id])
      @post = @post_part.post
      
      respond_to do |format|
        format.html do
          flash[:notice] = "Successfully created plaintext."
          redirect_to @one
        end
        format.js do
          @item_id = params[:item][:id]     
        end
      end
      
    else
      render :action => 'new'
    end
  end
  
  def edit
    @plaintext = Plaintext.find(params[:id])
    @projects = current_account.projects
  end
  
  def update
    @one = Plaintext.find(params[:id])
    
    #save_project
    
    if @one.update_attributes(params[:plaintext])
      respond_to do |format|
        format.html do
          flash[:notice] = "Successfully updated plaintext."
          redirect_to @one
        end
        format.js do
          @item_id = params[:item][:id]
          @post_part = PostPart.find(params[:item][:post_part_id])
          @post = @post_part.post
        end
      end
      
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @plaintext = Plaintext.find(params[:id])
    @plaintext.destroy
    flash[:notice] = "Successfully destroyed plaintext."
    redirect_to plaintexts_url
  end
  
  protected
  
end
