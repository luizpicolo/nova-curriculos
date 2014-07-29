FactoryGirl.define do
  factory :professional_experience do
    name_company { Faker::Company.name }
    las_post { Faker::Company.suffix }
    date_entrance Time.now
    date_exit Time.now
    jobs_current false
    attributions  { Faker::Lorem.paragraph(2) }
  end
end
