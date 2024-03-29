Rails.application.routes.draw do
  get 'static_pages/site_rules'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root 'home#index'
  
  get 'site_rules', to: 'static_pages#site_rules'

  resources :categories do
    resources :topics do
      resources :posts 
    end
  end
end