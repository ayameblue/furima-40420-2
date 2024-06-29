class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      puts @item.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
    end
    redirect_to root_path
  end

private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :explanation, :price, :category_id, :condition_id, :delivery_day_id, :delivery_fee_id, :prefecture_id).merge(user_id: current_user.id)
  end
end
