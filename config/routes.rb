# frozen_string_literal: true

Rails.application.routes.draw do
  resources :meetings_lists do
    resources :meetings_items do
      member do
        patch :complete
      end
    end
  end
  root 'meetings_lists#index'
end
