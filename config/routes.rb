Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'patient#index'

  get 'patient/index'
  get 'patient/list'
  get 'patient/new'
  post 'patient/create'
  patch 'patient/update'
  get 'patient/list'
  get 'patient/show'
  get 'patient/edit'
  get 'patient/delete'
  get 'patient/update'

  resources :patients
end
