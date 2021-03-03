class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @purchase_delivery = PurchaseDelivery.new
  end

  def create
    @purchase_delivery = PurchaseDelivery.new(purchase_params)
    if @purchase_delivery.valid?
      @purchase_delivery.save
      redirect_to root_path
    else 
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase_delivery).permit(:postal_code, :prefecture_id, :city, :address, :building, :tell).merge(user_id: current_user.id)
  end

  
end
