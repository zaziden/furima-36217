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
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless @item.user_id == current_user.id
    redirect_to action: :index
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
       redirect_to item_path(@item.id)
    else
      render :edit
    end
  end
end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image, :category_id, :item_condition_id, :delivery_charge_id, :area_id, :preparation_day_id, :price).merge(user_id: current_user.id)
  end
end