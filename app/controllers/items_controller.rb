class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

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
    if @item.update(item_params)
      redirect_to root_path
    else
      render 'new'
    end

  end

  def destroy
    if @item.destroy
       redirect_to root_path
       else
        render 'new'
       end
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
       @item.save
      redirect_to root_path
    else
      render 'edit'
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
