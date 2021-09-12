FactoryBot.define do
  factory :address do
    id { 2 }
    postcode { '123-4567' }
    prefecture_id { 4 }
    city { '東京都' }
    block { '1-1' }
    building { '東京ハイツ' }
    phone_number { '08012345643' }
    buyer_id { 3 }
  end
end
