class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :delivery_date

end
