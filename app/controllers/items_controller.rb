class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :move_to_sign_up, except: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC')
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user.id
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.valid?
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :information, :category_id, :status_id, :shipping_fee_id, :prefecture_id,
                                 :schedule_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_sign_up
    redirect_to user_session_path unless user_signed_in?
  end
end
