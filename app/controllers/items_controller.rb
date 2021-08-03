class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :unl, only: [:edit, :update]

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
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
     render :edit
    end
  end


  private
  def unl
    unless @item.user_id == current_user.id
    redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :image, :category_id, :item_condition_id, :delivery_charge_id, :area_id, :preparation_day_id, :price).merge(user_id: current_user.id)
  end
end