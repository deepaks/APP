class ProjectsController < ApplicationController
  before_filter :require_firm_site, :only => [:new, :create, :edit, :update]
  before_filter :require_account_member, :except => [:view]
  #before_filter :find_address
	  
  def index
    if is_main_site?
      @projects = Project.all
    else
      @projects = current_account.projects
    end
  end
  
  def view
    @project = Project.find(params[:id])
    @pictures = @project.pictures
    respond_to do |wants|
      wants.html { render :action => "view.haml", :layout => "firm_frontend" }
      wants.js {render :action => "view.rjs"}
    end
  end
  
  def show
    @project = Project.find(params[:id])
   
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    results = Geocoding::get( @project.address.street + " " + @project.address.city + " "+ @project.address.state + " " + @project.address.zip.to_s + " " +@project.address.country )
	    if results.status == Geocoding::GEO_SUCCESS
	      @coord = results[0].latlon
	      @map.overlay_init(GMarker.new(@coord,:info_window => "Our Office"))
	      @map.center_zoom_init(@coord,14)
    end
  end
  

  def new
    @project = Project.new
    @project.address = Address.new
    @portfolios = current_account.portfolios
  end
  


  def create
    @project = Project.new(params[:project])
    @project.portfolio_ids = params[:project][:portfolio_ids];
    @project.account = current_account
    # @address.save
    if @project.save
      flash[:notice] = "Successfully created project."
      redirect_to @project
    else
      render :action => 'new'
    end
  end
  
  def edit
    @project = Project.find(params[:id])
    @portfolios = current_account.portfolios
  end
  
  def update
    @project = Project.find(params[:id])
    @project.portfolio_ids = params[:project][:portfolio_ids];
    if @project.update_attributes(params[:project])
      flash[:notice] = "Successfully updated project."
      redirect_to @project
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "Successfully destroyed project."
    redirect_to projects_url
  end
  
  def new_post
    @project = Project.find(params[:id])
    @post = @project.posts.new
    @plaintext = Plaintext.new
  end
  
  def create_post
    @project = Project.find(params[:id])
    @post = Post.new(params[:post])
    @post.project = @project
    if @post.save
      @plaintext = Plaintext.new(params[:plaintext])
      @plaintext.add_to_post(@post)
      flash[:notice] = "Successfully created post."
      redirect_to edit_post_path(@post)
    else
      render :action => 'new_post'
    end
  end
  
  def set_cover
    @cover_picture = Picture.find(params[:cover])
    @project = Project.find(params[:id])
    
    @project.cover_picture = @cover_picture
    @project.save
  end


  #private

  #def find_address
	#  @klass = params[:commenter_type].capitalize.constantize
	#  @commenter = klass.find(params[:commenter_id])
	# end
    





end
