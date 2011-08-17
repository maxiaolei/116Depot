Depot::Application.routes.draw do
  resources :star_rates

  root :to => "store#index", :as => 'store'

    get 'admin'=>'admin#index'
  
  controller :sessions do
    get 'login'=>:new
    post 'login'=>:create
    delete 'logout'=>:destroy
  end

  
  scope '(:locale)' do
    resources :help
    
    resources :questions
    
    resources :users
    
    resources :orders
    
    resources :line_items
    
    resources :carts
    
    resources :comments
    
    resources :book_in_needs
    
    resources :products do
      get :who_bought, :on => :member
    end
    

    controller :orders do
      get :show_by_user_id
      post :ship
    end
  

    controller :products do
      post :add_comment
      post :search
      post :add_star_level
    end
    
    controller :store do
      get :contact
      get :question
      get :news
    end
    
    controller :help do
      get :customerlogin
      get :customerregister
      get :customerlogout
      get :language
      get :howtosearch
      get :howtobuy
      get :sendemail
      get :addcomment
      get :seenews
      get :contactus
      get :productmanage
      get :ordermanage
    end
    
    controller :questions do
      get :raise
      post :receive
    end
    
    controller :carts do
	  get :show
      get :clear
      post :set_quantity
    end
    
  end
end
