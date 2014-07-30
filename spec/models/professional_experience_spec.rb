require 'rails_helper'

RSpec.describe ProfessionalExperience, :type => :model do
  describe "Validations" do
		it 'should be invalid if there is no name company' do
			professional_experience = FactoryGirl.build :professional_experience, :name_company => nil
			expect(professional_experience).to be_invalid
		end

		it 'should be invalid if there is no last post' do
			professional_experience = FactoryGirl.build :professional_experience, :last_post => nil
			expect(professional_experience).to be_invalid
		end

		it 'should be invalid if there is no start date' do
			professional_experience = FactoryGirl.build :professional_experience, :start_date => nil
			expect(professional_experience).to be_invalid
		end

		it "object created is valid" do
			professional_experience = FactoryGirl.build(:professional_experience)
			expect(professional_experience).to be_valid
		end
  end

  describe "Associations" do
  	it { should belong_to(:candidate) }
  end
end
