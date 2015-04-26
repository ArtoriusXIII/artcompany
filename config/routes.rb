Rails.application.routes.draw do
  
  devise_for :users
  
  resources :employees do
    resources :accounts
  end
  
  get "welcome/index"

  get 'welcome/about'

  get 'welcome/contact'

  get 'welcome/faq'

  get 'welcome/pricing'

  get 'welcome/features'
  
 
  
  resources :invoices

  root to: 'welcome#index'
  
end

