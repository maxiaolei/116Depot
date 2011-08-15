class ProductsController < ApplicationController
  # GET /products
  # GET /products.xml
  skip_before_filter :authorize, :only => [:show, :add_comment, :search]
  def index
    @products = Product.paginate :page => params[:page], :per_page => 5

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

  # GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])
    @cart = current_cart

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.xml
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to(@product, :notice => I18n.t('.product_add')) }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to(@product, :notice => I18n.t('.product_update')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
  
  def who_bought
    @product = Product.find(params[:id])
    respond_to do |format|
      format.atom
      format.xml{ render :xml => @product }
    end
  end
  
  def add_comment
    @product = Product.find(params[:id])
    @product.comments << Comment.new(:product_id => params[:id], 
                                     :user_id => session[:user_id], 
                                     :content => params[:user_comment])
    respond_to do |format|
      if @product.save
        format.html { redirect_to(:action => 'show', :id => params[:id]) }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      end
    end
  end
  
  def search
    inputs = params[:input].split
    temp = []
    @products = []
    inputs.each do |input|
      temp = Product.find :all, 
                          :conditions => ["title like ? or category like ? or author like ? or description like ?", 
                                          "%" + input + "%", "%" + input + "%", "%" + input + "%", "%" + input + "%"]
      @products = @products | temp
    end
    
    inputs.each do |input|
      exp = Regexp.new(input, Regexp::IGNORECASE)
      if exp =~ "<font color='red'></font>"
        next
      end
       
      @products.each do |product|
        product.title = product.title.gsub(exp){ |matched|
          "<font color=red>" + matched + "</font>" 
        }
        product.category = product.category.gsub(exp){ |matched|
          "<font color='red'>" + matched + "</font>" 
        }
        product.author = product.author.gsub(exp){ |matched|
          "<font color='red'>" + matched + "</font>" 
        }
        product.description = product.description.gsub(exp){ |matched|
          "<font color='red'>" + matched + "</font>" 
        }
      end
    end
    
    @cart = current_cart
    respond_to do |format|
      format.html
    end
  end
  
end









