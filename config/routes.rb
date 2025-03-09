# filepath: /Users/rkoruk/code/ruby_be_genai_plgrnd/config/routes.rb
Rails.application.routes.draw do
  devise_for :users,
             defaults: { format: :json },
             controllers: {
               sessions: 'api/auth/sessions',
               registrations: 'users/registrations'
             }

  devise_scope :user do
    namespace :api do
      get "articles" => "articles#index"
      post "articles" => "articles#create"
      get "articles/:id" => "articles#show"

      namespace :auth do
        post 'sign_in', to: 'sessions#create'
        delete 'sign_out', to: 'sessions#destroy'
      end
    end
  end

  # Your health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end