FactoryGirl.define do
  factory :job_premiun do
    start_date (Time.now - 2.days)
    finish_date (Time.now + 2.days)
    job factory: :job
  end
end
