Bank::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users

  resources :money_transactions, :only => [:index, :new, :create]

  root :to => "home#index"
end
