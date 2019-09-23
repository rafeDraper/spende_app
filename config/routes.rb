Rails.application.routes.draw do
  resources :meetings_lists do
    resources :meetings_items
  end
  root 'meetings_lists#index'
end
