Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/edit' => 'devise/sessions#edit'
  end
  get 'static_pages/help'
  get 'static_pages/contact'
  resources :users
  resources :meetings_lists do
    resources :meetings_items do
      member do
        patch :complete
      end
    end
  end
  root 'static_pages#home'
end
