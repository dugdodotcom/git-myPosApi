Rails.application.routes.draw do
  use_doorkeeper
  # devise_for :users
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'api/v1/login',
               sign_out: 'api/v1/logout',
               registration: 'api/v1/signup'
             },
             controllers: {
               sessions: 'api/v1/sessions',
               registrations: 'api/v1/registrations',
               confirmations: 'confirmations',
               omniauth_callbacks: 'api/v1/omniauth_callbacks'
             }, 
             defaults: { format: :json }
  
  # versioning for api. Lets say v1 is for normal REST. 
  # And v2 using graphql for future development.
  namespace :api do
    namespace :v1 do

      # For testing first authentication
      resources :users, only: [] do
        collection do
          get :me
        end
      end

      resources :categories
      resources :items

      resources :settings, only: [:index, :create]
    end
  end
end