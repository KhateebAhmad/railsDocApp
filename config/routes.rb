Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'patients#index'

get 'patients/list'
get 'patients/delete'

  resources :patients
  devise_for :users
end
