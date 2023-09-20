Rails.application.routes.draw do
  devise_for :users

  resources :categories do
    resources :expenses
  end

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end

  root 'splash#index'
end
