# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
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
