class BuyersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  #before_action :sold_out_item, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id)
  end

 # def sold_out_item
  #  redirect_to root_path if @item.purchase.present?
  # end
end
