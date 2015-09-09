Rails.application.routes.draw do
  root 'welcome#index'

  resources 'dashboard', only: ['show']

  get '/auth/github/callback', to: 'sessions#create'
end
