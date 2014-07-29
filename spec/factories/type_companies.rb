FactoryGirl.define do
  factory :type_company do
    name { Faker::Company.catch_phrase }
  end
end
