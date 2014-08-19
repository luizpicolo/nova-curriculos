# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job_premiun do
    start_date Time.new(2014)
    finish_date Time.new(2015)
    job factory: :job
  end
end
