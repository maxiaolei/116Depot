class OrdersController < ApplicationController
  skip_before_filter :authorize,:only => [:new,:create,:show, :show_by_user_id]
  # GET /orders
  # GET /orders.xml
  def index
    @orders = Order.paginate :page=>params[:page], :order=>'created_at desc',
    :per_page => 10

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
    if current_cart.line_items.empty?
      redirect_to store_url, :notice => "Your cart is empty"
      return
    end
    
    @cart = current_cart
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.xml
  def create
    @order = Order.new(:user_id => session[:user_id], 
                       :name => params[:order][:name],
                       :address => params[:order][:address],
                       :email => params[:order][:email],
                       :pay_type => params[:order][:pay_type])
     
    @order.price = @order.add_line_items_from_cart(current_cart)                  
    #@order.add_line_items_from_cart(current_cart)

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        Notifier.order_received(@order).deliver
        format.html { redirect_to(store_url, :notice => t('.thanks')) }
        format.xml  { render :xml => @order, :status => :created, :location => @order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to(@order, :notice => 'Order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end
  
  def show_by_user_id
    @cart = current_cart
    user_id = session[:user_id]
    @orders = Order.paginate :page => params[:page], :per_page => 10,
                             :conditions => ["user_id = ?", user_id],
                             :order => "id DESC"
  end
  
  def ship
    @order = Order.find(params[:id])
    @order.state = '已发货'
    LineItem.find_all_by_order_id(@order.id).each do |item|
      @product = Product.find(item.product_id)
      @product.sold += item.quantity
      @product.save
    end    
    respond_to do |format|
      if @order.save
        Notifier.order_shipped(@order).deliver
        format.html {redirect_to :action => :index}
      end
    end
  end
end
