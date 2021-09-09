class BuyerAddress < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number

  validates :postcode, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: {other_than: 0, message: "Select"}
  validates :city, presence: true
  validates :block, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10}$|^\d{11}\z/ }

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture: prefecture, city: city, block: block, building: building, buyer_id: buyer.id)
  end
end
