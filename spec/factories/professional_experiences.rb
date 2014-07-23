# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :professional_experience do
    name_company "MyString"
    las_post "MyString"
    date_entrance "2014-07-22"
    date_exit "2014-07-22"
    jobs_current false
    attributions "MyText"
  end
end
