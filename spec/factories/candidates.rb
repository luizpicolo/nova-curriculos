FactoryGirl.define do
  factory :candidate do
    full_name { Faker::Name.name }
    is_male true
    birth_date Time.now
    zip_code { Faker::Address.zip_code }
    street { Faker::Address.street_name }
    number { Faker::Address.building_number }
    complement { Faker::Address.secondary_address }
    home_phone { Faker::PhoneNumber.phone_number }
    commercial_phone { Faker::PhoneNumber.phone_number }
    mobile_phone { Faker::PhoneNumber.cell_phone }
    message_phone { Faker::PhoneNumber.phone_number }
    position_of_interest { Faker::Name.name }
    last_salary { Faker::Number.number(4) }
    salary_pretension { Faker::Number.number(4) }
    mini_curriculum { Faker::Lorem.paragraph }
    share_facebook true

    city factory: :city
    user factory: :user

    # image File.open(File.join(Rails.root, '/spec/fixtures/files/image.png'))
  end
end
