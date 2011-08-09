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
  end
  
  def news
<<<<<<< HEAD
    #@products = Product.find(:all, :order => "id DESC", :limit => 2)
    @products = Product.find_by_sql("select * from products order by id DESC limit 2")
=======
    @product = Product.find(1)
>>>>>>> aa0b8a2818791fe2b70e9e8427e2729f21fa1720
  end
end
