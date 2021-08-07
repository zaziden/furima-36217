class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    @destination_order = DestinationOrder.new
    if current_user == @item.user || @item.order.present?
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @destination_order = DestinationOrder.new(order_params)
    if @destination_order.valid?
      pay_item
      @destination_order.save
      redirect_to root_path 
    else
      render :index
    end
  end

  private

    def order_params
      params.require(:destination_order).permit(:building_name, :post_code, :city, :street_number, :phone_number, :prefecture_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token], 
        currency: 'jpy' 
      )
    end

end

