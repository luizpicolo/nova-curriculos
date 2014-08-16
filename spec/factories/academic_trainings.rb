FactoryGirl.define do
  factory :academic_training do
    schooling factory: :schooling
    name_of_course { Faker::Lorem.word }
    start_date Time.now
    finish_date Time.now
    institution { Faker::Company.name }
    candidate factory: :candidate
  end
end
