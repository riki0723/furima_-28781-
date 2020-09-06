class OrdersController < ApplicationController

  def index
    @ordes = Order.all
  end
  
end
