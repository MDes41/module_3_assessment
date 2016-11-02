class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    if Item.find(params[:id]).destroy
      render json: Item.all
    end
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: item
    end
  end

  private
    def item_params
      params.permit(:name, :description, :image_url)
    end

end
