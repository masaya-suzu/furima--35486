class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :image
    with_options numericality: { with: /\A[0-9]+\z/, message: "Half-width number" }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" } do
      validates :price
    end
  end
  validates :product_condition_id
  validates :postage_id, numericality: { other_than: 0, message: "Select" }
  validates :prefecture_id, numericality: { other_than: 0, message: "Select" }
  validates :delivery_date_id, numericality: { other_than: 0, message: "Select" }
  validates :category_id, numericality: { other_than: 0, message: "Select" }
  validates :item_info, numericality: { other_than: 0, message: "Select" }
end