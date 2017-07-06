Rails.application.routes.draw do
  
  
  resources :portfolios do 
    resources :portfolio_items do 
      resources :portfolio_item_attachments
    end
  end
  resources :requirements
  resources :proposals
  resources :company_users
  devise_for :users
  resources :companies
  get '/my-portfolios', to: 'pages#my_portfolios'
  get '/my-proposals', to: 'pages#my_proposals'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"
end
