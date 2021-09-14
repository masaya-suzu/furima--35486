class BuyerAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: "Half-width number" }, format: {with: /\A\d{10}\z|\A\d{11}\z/, message: "is invalid."}
    validates :token
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "Select"}

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, buyer_id: buyer.id)
  end
end
