Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post :users, to: 'users#create'
      get :users, to: 'users#index'
      post :login, to: 'auth#create'

      get 'character_list', to: 'disney#character_list'
      get 'character_detail/:id', to: 'disney#character_detail'
      get 'characters', to: 'disney#character_by_query_params'
      resources :characters, only: [:create, :update, :destroy]

      get 'movies', to: 'disney#film_list'
      get 'movie_detail/:title', to: 'disney#film_detail'
      resources :films, only: [:create, :update, :destroy]
    end
  end
end
