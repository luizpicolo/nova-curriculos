# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :academic_training do
    schooling "MyString"
    name_of_course "MyString"
    start_date "2014-07-22"
    finish_date "2014-07-22"
    institution "MyString"
  end
end
