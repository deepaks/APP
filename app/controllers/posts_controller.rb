class PostsController < ApplicationController
  before_filter :require_account_member
  
  def index
    @posts = current_account.posts
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def sort
    @post = Post.find(params[:id])
    @post.post_parts.each do |f|
	    f.position = params["post_parts"].index(f.id.to_s)+1
	    f.save
    end
  end
  
  def view
    @post = Post.find(params[:id])
    @pictures = @post.pictures
    respond_to do |wants|
      wants.html { render :action => "view.haml", :layout => "firm_frontend" }
      wants.js {render :action => "view.rjs"}
    end
    
  end
    
  def create
    @post = Post.new(params[:post])
    if @post.save
      @plaintext = Plaintext.new(params[:plaintext])
      @plaintext.add_to_post(@post)
      flash[:notice] = "Successfully created post."
      redirect_to edit_post_path(@post)
    else
      render :action => 'new'
    end
  end
  
  def new
    @post = Post.new
    @plaintext = Plaintext.new
    @projects = current_account.projects
  end
  
  def add_part
    @post = Post.find(params[:id])
    @post_part = PostPart.new
    @type = params[:type]
    @one = @type.classify.constantize.new
    @media = current_account.pictures - @post.pictures # + current_account.videos - @post.videos
    @gallery_picker_form_url = {:controller => :posts, :action => :associate_media, :id => @post}
  end
  
  def edit_part
    @post = Post.find(params[:id])
    @post_part = PostPart.find(params[:part])
    
    @one = @post_part.content
    @type = @one.class.name
    
    # @type = params[:type]
    # @one = @type.classify.constantize.find(params[:object_id])
  end
  
  def show_part
    @post = Post.find(params[:id])
    @post_part = PostPart.find(params[:part])
    @container = params[:container]
    
    @one = @post_part.content
    @type = @one.class.name
    
    # @type = params[:type]
    # @one = @type.classify.constantize.find(params[:object_id])
  end
  
  def remove_part
    @post = Post.find(params[:id])
    @post_part = PostPart.find(params[:part])
    
    @post_part.destroy
  end
  
  def associate_media
    @post = Post.find(params[:id])
    @contents = params[:post][:content_ids]
    
    @post_parts = []
    
    @contents.each do |content_id|
      # to do: make it more generic
      content = Picture.find(content_id)
      @post_parts << content.add_to_post(@post.id)
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @project = @post.project
    
    if @post.destroy
      redirect_to @project
    else
      redirect_to @post
    end
  end
end
