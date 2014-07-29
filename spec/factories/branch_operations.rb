FactoryGirl.define do
  factory :branch_operation do
    name { Faker::Company.catch_phrase }
  end
end
