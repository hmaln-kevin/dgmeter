Rails.application.routes.draw do
  get 'welcome', to: 'welcome#index'
  devise_for :users
  resources :users
  resources :units
  resources :devices
  resources :load_topics
  resources :loads
  resources :measures

  root to: 'welcome#index'
  # out of use remain only study proposes
  get 'import', to: 'measures#import'
  # route to generate reports
  get '/report', to: 'units#report'

  mount ActionCable.server => '/cable'

  namespace :power_charts do
    get "by_day"
    get "by_week"
    get "by_month"
    get "by_year"
    get "by_user"
  end
  namespace :energy_charts do
    get "by_day"
    get "by_week"
    get "by_month"
    get "by_year"
    get "by_user"
  end
end
