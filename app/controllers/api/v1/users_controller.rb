class Api::V1::UsersController < ApplicationController
  # only logged in user
  before_action :authenticate_user!

  def me
    p "------------"
    p current_user
    # make only logged in user can see himself/herself
    authorize! :read, current_user
    render json: current_user
  end
end
