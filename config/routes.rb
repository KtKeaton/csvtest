Rails.application.routes.draw do
  resources :foos
  
  get :export, controller: :foos

  root "foos#index"
end
