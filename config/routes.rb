Rails.application.routes.draw do
  resources :alarms, except: [:new, :edit]
  resource :stations
end
