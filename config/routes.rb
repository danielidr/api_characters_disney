Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post :users, to: 'users#create'
      get :users, to: 'users#index'
      post :login, to: 'auth#create'
      get 'character_list', to: 'disney#character_list'
      get 'character_detail/:id', to: 'disney#character_detail'

      resources :characters, only: [:create, :update, :destroy]
    end
  end
end
