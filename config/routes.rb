Rails.application.routes.draw do


  #scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do


  scope ':locale', locale: /#{I18n.available_locales.join("|")}/ do

    #  scope ":locale", locale: /es|en/ do
    resources :accounting_records

    resources :categories
    resources :customers do 
      get 'find/:id' => 'customers#find', as: :store, :on =>  :collection
      resources :current_accounts
    end

    resources :invoice_stocks
    resources :stocks
    resources :brands
    resources :orders do
      #get :autocomplete_article_name, :on => :collection
    end
    resources :invoices do
      get :autocomplete_customer_name, :on => :collection
    end
    resources :suppliers
    resources :articles

    devise_for :users
    resources :users




  end 

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  #end

  authenticated :user do 
    root :to => 'articles#index'
  end
  unauthenticated :user do
    devise_scope :user do
      get "/" => "devise/sessions#new"
    end
  end


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
