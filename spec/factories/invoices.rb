# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invoice do
    company ""
    job ""
    price "MyString"
    status 1
  end
end
