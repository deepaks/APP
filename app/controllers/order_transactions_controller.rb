class OrderTransactionsController < ApplicationController
  # GET /order_transactions
  # GET /order_transactions.xml
  def index
    @order_transactions = OrderTransaction.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @order_transactions }
    end
  end

  # GET /order_transactions/1
  # GET /order_transactions/1.xml
  def show
    @order_transaction = OrderTransaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order_transaction }
    end
  end

  # GET /order_transactions/new
  # GET /order_transactions/new.xml
  def new
    @order_transaction = OrderTransaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order_transaction }
    end
  end

  # GET /order_transactions/1/edit
  def edit
    @order_transaction = OrderTransaction.find(params[:id])
  end

  # POST /order_transactions
  # POST /order_transactions.xml
  def create
    @order_transaction = OrderTransaction.new(params[:order_transaction])

    respond_to do |format|
      if @order_transaction.save
        flash[:notice] = 'OrderTransaction was successfully created.'
        format.html { redirect_to(@order_transaction) }
        format.xml  { render :xml => @order_transaction, :status => :created, :location => @order_transaction }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order_transaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /order_transactions/1
  # PUT /order_transactions/1.xml
  def update
    @order_transaction = OrderTransaction.find(params[:id])

    respond_to do |format|
      if @order_transaction.update_attributes(params[:order_transaction])
        flash[:notice] = 'OrderTransaction was successfully updated.'
        format.html { redirect_to(@order_transaction) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order_transaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /order_transactions/1
  # DELETE /order_transactions/1.xml
  def destroy
    @order_transaction = OrderTransaction.find(params[:id])
    @order_transaction.destroy

    respond_to do |format|
      format.html { redirect_to(order_transactions_url) }
      format.xml  { head :ok }
    end
  end
end
