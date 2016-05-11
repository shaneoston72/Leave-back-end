Rails.application.routes.draw do
  resources :weathers, except: [:new, :edit]
  get 'weathers/index'

  get 'weathers/show'

  get 'weathers/create'

  get 'weathers/update'

  get 'weathers/destroy'

  resources :alarms, except: [:new, :edit]
  resource :stations
end
