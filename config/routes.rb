Tipster::Application.routes.draw do

  # root :to => 'lists#index'
  root :to => 'lists#index'

  mount Citygate::Engine => '/'

  resources :lists do
    resources :tips do
      member do
        post :favorite
      end
    end

    member do
      post :follow
    end
  end

  match '/profile' => 'users#profile'
  match '/feed' => 'feeds#main'
  match '/follows' => 'feeds#follows'
  match '/favorites' => 'feeds#favorites'


  match '/community' => 'community#show'
end
