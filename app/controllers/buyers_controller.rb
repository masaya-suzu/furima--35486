class BuyersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  #before_action :sold_out_item, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new
  end

  def create
    #binding.pry
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new(buyer_params)
    #binding.pry
    if @buyer_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price],
        card: buyer_params[:token],
        currency: 'jpy'
      )
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

 # def sold_out_item
  #  redirect_to root_path if @item.purchase.present?
  # end
end
