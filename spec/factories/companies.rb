# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company do
    fancy_name { Faker::Company.name }
    corporate_name { Faker::Company.name }
    phone { Faker::PhoneNumber.phone_number }
    street { Faker::Address.street_name }
    number { Faker::Number.number(4) }
    facebook { Faker::Internet.domain_name }
    website { Faker::Internet.domain_name }
    type_company factory: :type_company
    cnpj { Faker::Company.duns_number }
    city factory: :city
    #branch_operations factory: :branch_operation
    description { Faker::Lorem.paragraph }
    user factory: :user
    #logo File.open(File.join(Rails.root, '/spec/fixtures/files/image.png'))
  end
end
