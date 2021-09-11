Rails.application.routes.draw do
  resources :time_trackers
  root 'time_trackers#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
