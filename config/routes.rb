Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post 'api/v1/auth/login', to: 'authentication#login'
end
