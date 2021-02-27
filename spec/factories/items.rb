FactoryBot.define do
  factory :item do
    image {Faker::Lorem.sentence}
    item_name {Faker::Lorem.sentence}
    information {Faker::Lorem.sentence}
    category_id {`メンズ`}
    status_id {'新品、未使用'}
    shipping_fee_id {'着払い(購入者負担)'}
    prefecture_id {'北海道'}
    schedule_id {'1~2で発送'}
    price {'3000'}
    association :user
  end
end
