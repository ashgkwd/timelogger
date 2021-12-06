Rails.application.routes.draw do
  devise_for :users
  root "timelogs#index"
  get 'timelogs', to: 'timelogs#index'
  get 'timelogs/create'
  get 'timelogs/edit'
  get 'timelogs/update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
