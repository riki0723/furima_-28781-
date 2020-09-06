class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:edit, :show, :update]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def update

    @item.update(item_params)
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
       @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :explation, :category_id, :status_id, :delivery_id, :area_id, :days_id, :price_id)
    .merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


end
