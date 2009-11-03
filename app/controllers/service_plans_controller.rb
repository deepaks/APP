class ServicePlansController < ApplicationController
  layout "app_frontend"
  # GET /service_plans
  # GET /service_plans.xml
  def index
    @service_plans = ServicePlan.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @service_plans }
    end
  end

  # GET /service_plans/1
  # GET /service_plans/1.xml
  def show
    @service_plan = ServicePlan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @service_plan }
    end
  end

  # GET /service_plans/new
  # GET /service_plans/new.xml
  def new
    @service_plan = ServicePlan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @service_plan }
    end
  end

  # GET /service_plans/1/edit
  def edit
    @service_plan = ServicePlan.find(params[:id])
  end

  # POST /service_plans
  # POST /service_plans.xml
  def create
    @service_plan = ServicePlan.new(params[:service_plan])

    respond_to do |format|
      if @service_plan.save
        flash[:notice] = 'ServicePlan was successfully created.'
        format.html { redirect_to(@service_plan) }
        format.xml  { render :xml => @service_plan, :status => :created, :location => @service_plan }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @service_plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /service_plans/1
  # PUT /service_plans/1.xml
  def update
    @service_plan = ServicePlan.find(params[:id])

    respond_to do |format|
      if @service_plan.update_attributes(params[:service_plan])
        flash[:notice] = 'ServicePlan was successfully updated.'
        format.html { redirect_to(@service_plan) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @service_plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /service_plans/1
  # DELETE /service_plans/1.xml
  def destroy
    @service_plan = ServicePlan.find(params[:id])
    @service_plan.destroy

    respond_to do |format|
      format.html { redirect_to(service_plans_url) }
      format.xml  { head :ok }
    end
  end
end
