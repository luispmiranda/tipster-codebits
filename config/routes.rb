Tipster::Application.routes.draw do

  mount Citygate::Engine => '/'

  resources :lists do
    resources :tips
  end

end
