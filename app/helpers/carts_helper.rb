module CartsHelper
  def get_url
    if session[:user_id]
      new_order_url
    else
      url_for(:controller => 'sessions', :action => 'new')
    end
  end
end
