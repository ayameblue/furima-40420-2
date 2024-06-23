class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      puts @item.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end
end

private
def item_params
  params.require(:item).permit(:image, :item_name, :explanation, :price, :category_id, :condition_id, :delivery_day_id, :delivery_fee_id, :prefecture_id).merge(user_id: current_user.id)
end
