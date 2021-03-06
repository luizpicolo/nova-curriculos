FactoryGirl.define do
  factory :job do
  	job_title { Faker::Name.title }
  	company factory: :company
  	salary_range { Faker::Commerce.price }
  	type_contract factory: :type_contract
  	job_category factory: :job_category
  	amount_vacancies { Faker::Number.number(2) }
  	time_contract { Faker::Name.title }
  	description { Faker::Lorem.paragraph(2) }
  	requirements { Faker::Lorem.paragraph(2) }
  	period_of_work { Faker::Name.title }
  	other_information { Faker::Lorem.paragraph(2) }
  	start_date (Time.now)
  	finish_date (Time.now)
    term true
    status true
    city factory: :city
  end
end
