require 'rails_helper'

RSpec.describe Job, :type => :model do
  describe "Validations" do
		it 'should be invalid if there is no job title' do
			job = FactoryGirl.build :job, :job_title => nil
			expect(job).to be_invalid
		end

		it 'should be invalid if there is no company' do
			job = FactoryGirl.build :job, :company => nil
			expect(job).to be_invalid
		end

		it 'should be invalid if there is no salary range' do
			job = FactoryGirl.build :job, :salary_range => nil
			expect(job).to be_invalid
		end

		it 'should be invalid if there is no type contract' do
			job = FactoryGirl.build :job, :type_contract => nil
			expect(job).to be_invalid
		end

		it 'should be invalid if there is no amount vacancies' do
			job = FactoryGirl.build :job, :amount_vacancies => nil
			expect(job).to be_invalid
		end

		it 'should be invalid if there is no time contract' do
			job = FactoryGirl.build :job, :time_contract => nil
			expect(job).to be_invalid
		end

		it 'should be invalid if there is no description' do
			job = FactoryGirl.build :job, :description => nil
			expect(job).to be_invalid
		end

		it 'should be invalid if there is no requirements' do
			job = FactoryGirl.build :job, :requirements => nil
			expect(job).to be_invalid
		end

		it 'should be invalid if there is no period_of_work' do
			job = FactoryGirl.build :job, :period_of_work => nil
			expect(job).to be_invalid
		end

		it 'should be invalid if there is no start date' do
			job = FactoryGirl.build :job, :start_date => nil
			expect(job).to be_invalid
		end

		it 'should be invalid if there is no finish date' do
			job = FactoryGirl.build :job, :finish_date => nil
			expect(job).to be_invalid
		end

		it "object created is valid" do
			job = FactoryGirl.build(:job)
			expect(job).to be_valid
		end
  end

  describe "Associations" do
  	it { should belong_to(:type_contract) }
  	it { should belong_to(:company) }
  	it { should belong_to(:job_category) }
    it { should belong_to(:city) }
    it { should have_one(:job_premiun) }
  end

end
