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

  # devise_scope :user do
  #   post 'api/v1/signup', to: 'api/v1/registrations#create'
  # end
  root 'item#index'

  namespace :api do
    namespace :v1 do
      
    end
  end
end