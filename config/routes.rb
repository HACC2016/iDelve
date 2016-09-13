Rails.application.routes.draw do
  get 'idelve/new'
  get 'idelve/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
end
