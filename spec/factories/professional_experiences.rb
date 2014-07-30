FactoryGirl.define do
  factory :professional_experience do
    name_company { Faker::Company.name }
    last_post { Faker::Company.suffix }
    start_date Time.now
    finish_date Time.now
    jobs_current false
    attributions  { Faker::Lorem.paragraph(2) }
  end
end
