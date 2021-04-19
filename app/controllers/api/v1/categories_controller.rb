class Api::V1::CategoriesController < ApplicationController
  # only logged in user
  before_action :specified_category, only: [:show, :destroy, :update]

  def create
    category = Category.new(create_category_params)
    authorize! :create, category
    category.save
    render_resource(category)
  end

  def index
    @categories = Category.where(deleted: false).order(id: :desc)
    authorize! :index, @categories
    render json: @categories
  end

  def show
    authorize! :read, @category
    render_resource(@category)
  end

  def update
    authorize! :update, @category
    @category.update(update_category_params)
    render_resource(@category)
  end

  def destroy
    authorize! :destroy, @category
    @category.update(deleted: true)
    render_resource(@category)
  end

  private

  def specified_category
    @category = Category.find(params[:id])
  end

  def create_category_params
    params.permit(
      :name,
    ).merge(user: current_resource_owner)
  end

  def update_category_params
    params.permit(
      :name,
    )
  end
end
