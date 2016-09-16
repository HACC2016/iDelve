Rails.application.routes.draw do
  get 'idelve/new'
  get 'idelve/show'
  get 'idelve/iam'
  get 'idelve/iwish'
  get 'idelve/iconnect'
  get 'idelve/upload'
  post 'idelve/upload', to: 'idelve#do_upload'

  get 'medium/new'
  post 'medium/create'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'idelve#home'


end
