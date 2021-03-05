FactoryBot.define do
  factory :purchase_delivery do
    postal_code { Faker::Lorem.sentence }
    prefecture_id { 2 }
    city         { Faker::Lorem.sentence }
    address      { "北極1000番地" }
    building     { "ビル" }
    tell         
    purchase
    
  end
end
