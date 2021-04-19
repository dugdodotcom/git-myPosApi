class Api::V1::RegistrationsController < Devise::RegistrationsController
  protect_from_forgery with: :null_session, only: [:create]

  def create
    user = CreateUser.new(sign_up_params).call
    render_resource(user)
  end
end
