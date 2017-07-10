Rails.application.routes.draw do
  resources :portfolios do 
    resources :portfolio_items do 
      resources :portfolio_item_attachments
    end
  end
  
  resources :proposals do 
    resources :requirements
    resources :proposal_requests
  end 
  resources :company_users
  devise_for :users
  resources :companies
  get '/my-portfolios', to: 'pages#my_portfolios'
  get '/my-proposals', to: 'pages#my_proposals'
  get '/my-requests', to: 'pages#my_requests'
  get 'proposal-selection', to: 'pages#proposal_selection'
  get '/proposals/:id/add-proposal-request', to: 'proposal_requests#add_request'
  get 'select-role', to: 'pages#select_role'
  get 'assign-role', to: 'pages#assign_role'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"
end
