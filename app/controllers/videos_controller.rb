class VideosController < ApplicationController
  before_filter :require_firm_site, :only => [:new, :create, :edit, :update]
  
  def index
    @videos = Video.all
  end
  
  def show
    @video = Video.find(params[:id])
  end
  
  def new
    @video = Video.new
    
    # # for now
    # @video.post_part = PostPart.new
    # @video.post_part.post = Post.new
    
    @projects = current_account.projects
  end
  
  def create
    @one = Video.new(params[:video])
    @one.account = current_account
    
    if @one.save
      
      @post_part = @one.add_to_post(params[:post][:id])
      @post = @post_part.post
      
      respond_to do |format|
        format.html do
          flash[:notice] = "Successfully created video."
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
    @video = Video.find(params[:id])
    @projects = current_account.projects
  end
  
  def update
    @video = Video.find(params[:id])
    @item_id = params[:item][:id]
    @post_part = PostPart.find(params[:item][:post_part_id])
    @post = @post_part.post
    if @video.update_attributes(params[:video])
      
      flash[:notice] = "Successfully updated video."
      redirect_to @video
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    flash[:notice] = "Successfully destroyed video."
    redirect_to videos_url
  end
  
end
