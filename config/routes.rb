# == Route Map
#

Rails.application.routes.draw do
  resources :audit_entries
  root to: "audit_entries#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
