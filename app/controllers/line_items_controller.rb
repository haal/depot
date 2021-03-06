class LineItemsController < ApplicationController
  skip_before_filter :authorize

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @line_items }
    end
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/new
  # GET /line_items/new.json
  def new
    @line_item = LineItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/1/edit
  def edit
    @line_item = LineItem.find(params[:id])
  end

  # POST /line_items
  # POST /line_items.json
  def create
    @cart = current_cart
    #reset sesion[:counter]
    session[:counter] = 0
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id, @cart.id, product.price)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to store_url }
        format.js { @current_item = @line_item }
        format.xml  { render :xml => @line_item, :status => :created, :location => @line_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @line_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /line_items/1
  # PUT /line_items/1.json
  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @cart = current_cart
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    respond_to do |format|
      if current_cart.line_items.empty?
        format.html { redirect_to store_url, :notice => 'Your cart is currently empty' }
        format.js { render :template => "line_items/decrement.js.erb" }
      else
        format.html { redirect_to current_cart, :notice => 'Item removed' }
        format.js { render :template => "line_items/decrement.js.erb" }
      end
      format.json { head :no_content }
    end
  end

  # POST /line_items/1/decrement
  def decrement
    @cart = current_cart
    @line_item = @cart.line_items.find_by_id(params[:id])
    @line_item.quantity -= 1

    if @line_item.quantity == 0
      @line_item.destroy
    end

    begin @line_item.update_attributes(params[:line_item])
    rescue
    end
    respond_to do |format|
      format.js
    end
  end
end
