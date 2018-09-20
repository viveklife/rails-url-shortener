Rails.application.routes.draw do
  resources :urls
  resources :urls, except: [:edit, :update], param: :short_url
  get '/:short_url', to: 'urls#short', as: :short
  root to: 'urls#index'
end
