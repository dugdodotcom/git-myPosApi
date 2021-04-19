class Api::V1::SettingsController < ApplicationController
  # only logged in user
  before_action :specified_category, only: [:show, :destroy, :update]

  def create
    @setting = Setting.first
    if @setting
      authorize! :create, @setting
      @setting.update(update_setting_params)
    else
      @setting = Setting.new(create_setting_params)
      authorize! :create, @setting
      @setting.save
    end 
    render_resource(@setting)
  end

  def index
    @setting = Setting.first
    authorize! :read, @setting

    unless @setting
      @setting = {}
    end
    render json: @setting
  end

  private

  def create_setting_params
    params.permit(
      :tax,
    ).merge(user: current_resource_owner)
  end

  def update_setting_params
    params.permit(
      :tax,
    )
  end
end
