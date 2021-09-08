class BuyersController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @item = Item.find(params[:item_id])
    @buyer = Buyer.new
  end

  def create
    @buyer = Buyer.create(buyer_params)
    Address.create(address_params)
    redirect_to root_path
  end

  private

  def buyer_params
    params.permit(:price).merge(user_id: current_user.id)
  end

  def address_params
    params.permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(buyer_id: @buyer.id)
  end
end
