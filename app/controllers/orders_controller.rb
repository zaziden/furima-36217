class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :ite, only: [:index, :create]
  before_action :curr, only: [:index, :create]

  def index
    @destination_order = DestinationOrder.new
  end

  def create
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

    def ite
      @item = Item.find(params[:item_id])
    end

    def curr
      if current_user == @item.user || @item.order.present?
        redirect_to root_path
      end
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

