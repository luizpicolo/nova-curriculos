FactoryGirl.define do
  factory :candidate do
    is_male true
    bith_date Time.now
    zip_code { Faker::Address.zip_code }
    street { Faker::Address.street_name }
    number { Faker::Address.building_number }
    complement { Faker::Address.secondary_address }
    home_phone { Faker::PhoneNumber.phone_number }
    mobile_phone { Faker::PhoneNumber.cell_phone }
    city factory: :city
    user factory: :user
    #image File.open(File.join(Rails.root, '/spec/fixtures/files/image.png'))
  end
end
