class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :title, null: false
      t.integer    :price, null: false
      t.integer    :product_condition_id, null: false
      t.integer    :postage_id, null: false
      t.integer    :prefecture_id, null: false
      t.integer    :delivery_date_id, null: false
      t.integer    :category_id, null: false
      t.text       :item_info, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
