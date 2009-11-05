class FirmsController < ApplicationController
  # GET /firms
  # GET /firms.xml
   layout :check_layout
  def index
    #@firms = Firm.all
    #@user_type = UserType.find_by_type('Admin')
    @users = User.find(:all, :conditions => ['user_type_id = ?', 2 ])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /firms/1
  # GET /firms/1.xml
  def show
    @firm = Firm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @firm }
    end
  end

  # GET /firms/new
  # GET /firms/new.xml
  def new
    #@firm = Firm.new
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @firm }
    end
  end

  # GET /firms/1/edit
  def edit
    @firm = Firm.find(params[:id])
  end

  # POST /firms
  # POST /firms.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:notice] = 'Firm was successfully created.'
        format.html { redirect_to(@user) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /firms/1
  # PUT /firms/1.xml
  def update
    @firm = Firm.find(params[:id])

    respond_to do |format|
      if @firm.update_attributes(params[:firm])
        flash[:notice] = 'Firm was successfully updated.'
        format.html { redirect_to(@firm) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @firm.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /firms/1
  # DELETE /firms/1.xml
  def destroy
    @firm = Firm.find(params[:id])
    @firm.destroy

    respond_to do |format|
      format.html { redirect_to(firms_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def check_layout
    is_main_site? ? "app_frontend" : "firm_frontend"
  end
end
