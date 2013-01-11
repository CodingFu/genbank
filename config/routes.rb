Bank::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users

  resources :money_transactions, :only => [:index, :new, :create]
  match "pay_for/:id" => "pay_for#pay", :as => :pay_for
  match "pay_for" => "pay_for#transfer", :method => :post, :as => :pay_for_transfer
  root :to => "home#index"
end
