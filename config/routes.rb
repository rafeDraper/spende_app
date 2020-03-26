# frozen_string_literal: true

Rails.application.routes.draw do
  get 'static_pages/help'
  get 'static_pages/contact'
  get 'static_pages/home'
  devise_for :users
  resources :meetings_lists do
    resources :meetings_items do
      member do
        patch :complete
      end
    end
  end
  root 'meetings_lists#index'
end
