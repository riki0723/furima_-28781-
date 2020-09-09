class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    # @orders = @item.order.includes(:item_id)
  end

end
