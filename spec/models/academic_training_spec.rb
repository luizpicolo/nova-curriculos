require 'rails_helper'

RSpec.describe AcademicTraining, :type => :model do
  describe "Validations" do
		it 'should be invalid if there is no name schooling' do
			academic_training = FactoryGirl.build :academic_training, :schooling => nil
			expect(academic_training).to be_invalid
		end

		it 'should be invalid if there is no name of course' do
			academic_training = FactoryGirl.build :academic_training, :name_of_course => nil
			expect(academic_training).to be_invalid
		end

		it 'should be invalid if there is no start date' do
			academic_training = FactoryGirl.build :academic_training, :start_date => nil
			expect(academic_training).to be_invalid
		end

		it 'should be invalid if there is no name institution' do
			academic_training = FactoryGirl.build :academic_training, :institution => nil
			expect(academic_training).to be_invalid
		end

		it "object created is valid" do
			academic_training = FactoryGirl.build(:academic_training)
			expect(academic_training).to be_valid
		end
  end

  describe "Association" do
  	it { should belong_to(:candidate) }
  end
end
