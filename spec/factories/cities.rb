FactoryGirl.define do
  factory :city do
    name { Faker::Address.city }
    state factory: :state
  end
end
