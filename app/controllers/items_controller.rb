class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end

    def show
      @item = Item.find(params[:id])
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image, :category_id, :item_condition_id, :delivery_charge_id, :area_id, :preparation_day_id, :price).merge(user_id: current_user.id)
  end
end
