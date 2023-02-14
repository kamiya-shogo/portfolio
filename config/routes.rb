Rails.application.routes.draw do
  root 'static_pages#top'
  get '/signup', to: 'users#new'

  # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  #管理者 注文一覧
  get '/order_list_manager', to: 'task_contents#order_list_manager'
  
  resources :users do
    member do
      get 'edit_basic_info'
      patch 'update_basic_info'
      # カートを注文する
      get 'edit_order'
      patch 'update_order'
      delete 'delete_order'
      # 注文一覧
      get 'order_index'
      get 'order_show'
    end
    resources :tasks do
      member do
        get 'edit_add_cart'
        patch 'update_add_cart'
        # カートの編集・削除
        # get 'order_edit'
        # patch 'order_update'
        # delete 'order_delete'
      end
      resources :task_contents, except: [:index, :show]
    end
  end
end