Tipster::Application.routes.draw do

  # root :to => 'lists#index'
  root :to => 'home#index'

  mount Citygate::Engine => '/'

  resources :lists do
    resources :tips
  end

  match '/profile' => 'users#profile'
end
