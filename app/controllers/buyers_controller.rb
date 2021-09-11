class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  #before_action :sold_out_item, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      pay_item
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price],
        card: buyer_params[:token],
        currency: 'jpy'
      )
  end

end
