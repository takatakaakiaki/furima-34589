FactoryBot.define do
  factory :item do
    image {Faker::Lorem.sentence}
    item_name {Faker::Lorem.sentence}
    information {Faker::Lorem.sentence}
    category_id {'3'}
    status_id {'3'}
    shipping_fee_id {'3'}
    prefecture_id {'3'}
    schedule_id {'3'}
    price {'3000'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end
