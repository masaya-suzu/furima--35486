class Address < ApplicationRecord
  belongs_to :buyer

  validates :postcode, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: {other_than: 0, message: "Select"}
  validates :city, presence: true
  validates :block, presence: true
  validates :building, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10}$|^\d{11}\z/ }
end
