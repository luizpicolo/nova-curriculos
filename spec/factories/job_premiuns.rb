FactoryGirl.define do
  factory :job_premiun do
    start_date (Time.now)
    finish_date (Time.now)
    job factory: :job
  end
end
