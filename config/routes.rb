require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :employees
  as :employee do
    get 'employees/edit' => 'devise/registrations#edit', as: 'edit_employee_registration'
    put 'employees' => 'devise/registrations#update', as: 'employee_registration'
  end

  namespace :api do
    namespace :v1 do
      resources :customers
      resources :people
      resources :businesses
      resources :employees
      resources :teams
      resources :users_team
      resources :messages
      resources :sent_messages
      resources :received_messages
    end

    namespace :v2 do
      resources :messages_counters
    end
  end
  # mount using default path: /email_processor
  mount_griddler
  get '*path', to: 'home#show'
  root 'home#show'
end
