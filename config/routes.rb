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


  get 'proposals/wizard-steps/client-info', to: 'proposals#set_demo_client_info', as: 'proposal_wizard_client_info'
  post 'proposals/wizard-steps/client-info', to: 'proposals#set_demo_client_info'
  get 'proposals/wizard-steps/title', to: 'proposals#set_proposal_title', as: 'proposal_wizard_title'
  post 'proposals/wizard-steps/title', to: 'proposals#set_proposal_title'
  get 'proposals/wizard-steps/brief', to: 'proposals#set_proposal_brief', as: 'proposal_wizard_brief'
  post 'proposals/wizard-steps/brief', to: 'proposals#set_proposal_brief'
  get 'proposals/wizard-steps/content-type', to: 'proposals#set_proposal_content_type', as: 'proposal_wizard_content_type'
  post 'proposals/wizard-steps/content-type', to: 'proposals#set_proposal_content_type'
  get 'proposals/wizard-steps/add-ons', to: 'proposals#set_proposal_add_ons', as: 'proposal_wizard_add_ons'
  post 'proposals/wizard-steps/add-ons', to: 'proposals#set_proposal_add_ons'
  get 'proposals/wizard-steps/focus-points', to: 'proposals#set_proposal_focus_points', as: 'proposal_wizard_focus_points'
  post 'proposals/wizard-steps/focus-points', to: 'proposals#set_proposal_focus_points'
  get 'proposals/wizard-steps/ci-guides', to: 'proposals#set_proposal_ci_guides', as: 'proposal_wizard_ci_guides'
  post 'proposals/wizard-steps/ci-guides', to: 'proposals#set_proposal_ci_guides'
  get 'proposals/wizard-steps/scene', to: 'proposals#set_proposal_scene', as: 'proposal_wizard_scene'
  post 'proposals/wizard-steps/scene', to: 'proposals#set_proposal_scene'
  get 'proposals/wizard-steps/bts', to: 'proposals#set_proposal_bts', as: 'proposal_wizard_bts'
  post 'proposals/wizard-steps/bts', to: 'proposals#set_proposal_bts'


  get 'proposal/wizard-steps/step-0', to: 'proposals#step_0'
  get 'proposal/wizard-steps/step-1', to: 'proposals#step_1'
  post 'proposal/wizard-steps/step-2', to: 'proposals#step_2'
  post 'proposal/wizard-steps/step-3', to: 'proposals#step_3'
  post 'proposal/wizard-steps/step-4', to: 'proposals#step_4'
  post 'proposal/wizard-steps/step-5', to: 'proposals#step_5'
  post 'proposal/wizard-steps/step-6', to: 'proposals#step_6'
  post 'proposal/wizard-steps/step-7', to: 'proposals#step_7'
  post 'proposal/wizard-steps/step-8', to: 'proposals#step_8'

  get 'proposal/wizard-steps/step-2', to: 'proposals#step_2'
  get 'proposal/wizard-steps/step-3', to: 'proposals#step_3'
  get 'proposal/wizard-steps/step-4', to: 'proposals#step_4'
  get 'proposal/wizard-steps/step-5', to: 'proposals#step_5'
  get 'proposal/wizard-steps/step-6', to: 'proposals#step_6'
  get 'proposal/wizard-steps/step-7', to: 'proposals#step_7'
  get 'proposal/wizard-steps/step-8', to: 'proposals#step_8'
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
