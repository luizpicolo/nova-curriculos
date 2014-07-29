FactoryGirl.define do
  factory :extra_course do
    name { Faker::Lorem.word }
    local { Faker::Address.city }
    description { Faker::Lorem.paragraph(2) }
    candidate factory: :candidate
  end
end
