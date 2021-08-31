FactoryBot.define do
  factory :item do
    title                        {"名前"}
    item_info                    {"説明"}
    price                        {2000}
    category_id                  {1}
    product_condition_id         {1}
    postage_id                   {1}
    prefecture_id                {1}
    delivery_date_id             {1}
    association :user

    after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
