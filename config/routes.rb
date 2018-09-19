Rails.application.routes.draw do
  resources :urls, except: [:edit, :update], param: :short_url
  get '/:short_url', to: 'urls#show'
  root to: 'urls#index'
end
