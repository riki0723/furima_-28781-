class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    
  end


  def create
    @item = Item.find(params[:item_id])
    @donation = OrderDonation.new(donation_params) 
    if @donation.valid?
      pay_item
      @donation.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def donation_params
    params.permit(:adressnumber, :area_id, :sichouson, :banchi, :bilding, :phonenumber, :token, :item_id).merge(user_id: current_user.id)
  end

  def order_params
    params.permit(:price_id, :token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price_id,  # 商品の値段
      card: order_params[:token],   # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end
