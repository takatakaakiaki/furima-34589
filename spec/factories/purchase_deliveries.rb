FactoryBot.define do
  factory :purchase_delivery do
    postal_code   { '123-4567' }
    prefecture_id { 2 }
    city          { Faker::Lorem.sentence }
    address       { '北極1000番地' }
    building      { 'ビル' }
    tell          { '12345678912' }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
