Rails.application.routes.draw do
  resources :rooms
  post 'login' => "home#login"
  get 'logout' => "home#logout"
  resources :rooms do
    resources :messages
  end

  root 'rooms#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
