Rails.application.routes.draw do
  resources :flex_templates
  resources :users
  get 'welcome', to: 'welcome#index'
end
