Rails.application.routes.draw do
  devise_for :users
  root "timelogs#index"
  
  resources :timelogs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
