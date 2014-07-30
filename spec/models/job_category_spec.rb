require 'rails_helper'

RSpec.describe JobCategory, :type => :model do
  describe "Validations" do
		it 'should be invalid if there is no name' do
			job_category = FactoryGirl.build :job_category, :name => nil
			expect(job_category).to be_invalid
		end

		it "object created is valid" do
			job_category = FactoryGirl.build(:job_category)
			expect(job_category).to be_valid
		end
  end

  describe "Associations" do
  	it { should have_many(:jobs) }
  end
end
