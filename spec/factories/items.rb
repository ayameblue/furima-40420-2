FactoryBot.define do
  factory :item do
    item_name         { Faker::Name.initials }
    explanation       { Faker::Lorem.sentence }
    category_id       { 2 }
    condition_id      { 2 }
    delivery_fee_id   { 2 }
    prefecture_id     { 2 }
    delivery_day_id   { 2 }
    price             { 300 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
