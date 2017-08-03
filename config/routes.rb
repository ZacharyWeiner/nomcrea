Rails.application.routes.draw do
  resources :waitlists
  resources :schedule_items
  resources :schedules
  resources :tags
  resources :portfolios do 
    resources :portfolio_items do 
      resources :portfolio_item_attachments
    end
  end
  
  resources :proposals do 
    get :autocomplete_tag_name, :on => :collection
    resources :requirements
    get 'accept-requirement/:id', to: 'requirements#accept_requirement', as: 'accept-requirement'
    resources :proposal_requests
  end 
  resources :company_users
  devise_for :users
  resources :companies
  get '/my-portfolios', to: 'pages#my_portfolios'
  get '/my-proposals', to: 'pages#my_proposals'
  get '/my-requests', to: 'pages#my_requests'
  get '/my-schedule', to: 'pages#my_schedule'
  get 'user-pages/my-skills', to: 'user_pages#my_skills'
  post 'user-pages/my-skills', to: 'user_pages#my_skills'
  get 'proposal-selection', to: 'pages#proposal_selection'
  get '/proposals/:id/add-proposal-request', to: 'proposal_requests#add_request'
  get 'select-role', to: 'pages#select_role'
  get 'assign-role', to: 'pages#assign_role'
  get 'accept-request', to: 'proposal_requests#accept_request'
  get 'accept-request/:id', to: 'proposal_requests#accept_request'
  get 'search/proposals/:id', to: 'search#index', as: "search/proposals"
  get 'theme', to:'themes#theme', as: 'contact'
  resources :charges
  post 'contact', to:'contact_submission#save', as: 'contact_submit'
  get 'contact_submissions', to: 'contact_submission#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "themes#theme"
end
