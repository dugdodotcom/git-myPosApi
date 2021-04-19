class Api::V1::ItemsController < ApplicationController
  # only logged in user
  before_action :specified_item, only: [:show, :destroy, :update]
  # before_action :convert_params, only: [:create]

  def create
    item = Item.new(create_item_params)
    authorize! :create, item
    item.save
    params_gallery = gallery_params
    p "test"
    p params_gallery[:image]
    if !params_gallery[:image].nil? and params_gallery[:image] != "null"
      gallery = item.galleries.new(params_gallery)
      gallery.save
    end
    render json: {data: merge_category(item)}
  end

  def index
    @items = Item.where(deleted: false).order(id: :desc)
    authorize! :index, @items
    render json: @items
  end

  def show
    authorize! :read, @item
    render_resource(@item)
  end

  def update
    authorize! :update, @item
    @item.update(update_item_params)
    render_resource(@item)
  end

  def destroy
    authorize! :destroy, @item
    @item.update(deleted: true)
    render_resource(@item)
  end

  private

  def specified_item
    @item = Item.find(params[:id])
  end

  def merge_category(item)
    p item
    item_data = item.attributes
    item_data["category"] = {name: item.category.name}
    item_data
  end

  def convert_params
    @params = ActionController::Parameters.new( JSON.parse(request.body.read) )
  end

  def create_item_params
    params.permit(
      :name,
      :category_id, 
      :rate, 
      :quantity, 
      :per
    )
    .merge(user: current_resource_owner)
  end

  def gallery_params
    params.permit(:image)
  end

  def update_item_params
    params.permit(
      :name,
      :category_id, 
      :rate, 
      :quantity, 
      :per
    )
  end
end
