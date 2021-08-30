class ItemsController < ApplicationController
  def index
    @item = Item.all
    @item = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    #binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render template: "items/new"
    end 
  end


  private

  def item_params
    params.require(:item).permit(:title,:image,:price,:product_condition_id,:postage_id,:prefecture_id,:delivery_date_id,:category_id,:item_info).merge(user_id: current_user.id)
  end
  
end
