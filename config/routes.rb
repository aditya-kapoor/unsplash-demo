Rails.application.routes.draw do
  resources :home, only: [] do
    get :search, on: :collection
  end
  root "home#index"
end
