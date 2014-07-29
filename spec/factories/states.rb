FactoryGirl.define do
  factory :state do
    name { Faker::Address.state }
    country factory: :country
  end
end
