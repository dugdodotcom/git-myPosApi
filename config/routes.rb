Rails.application.routes.draw do
  # devise_for :users
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }
  
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
    end
  end
end