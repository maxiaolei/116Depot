class StoreController < ApplicationController
  skip_before_filter :authorize
  def index
    if params[:set_locale]
      redirect_to store_path(:locale => params[:set_locale])
    else
      #@products = Product.all
      @products = Product.paginate :page => params[:page], :order => "title",
                  :per_page => 3
      @cart = current_cart
    end
  end
  
  def contact
    @cart = current_cart
  end
  
  def news
    @cart = current_cart
    @products1 = Product.find_by_sql("select * from products order by id DESC limit 5")
    @products2 = Product.find_by_sql("select * from products order by sold DESC limit 5")
  end
end
