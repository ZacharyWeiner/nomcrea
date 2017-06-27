Rails.application.routes.draw do
  resources :requirements
  resources :proposals
  resources :company_users
  devise_for :users
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"
end
