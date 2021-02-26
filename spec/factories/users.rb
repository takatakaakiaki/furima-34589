FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { '111aaa' }
    password_confirmation { password }
    last_name { '太郎' }
    first_name { '佐藤' }
    last_name_kana { 'タロウ' }
    first_name_kana { 'サトウ' }
    birthday { Faker::Date.backward }
  end
end
