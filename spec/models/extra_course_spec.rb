require 'rails_helper'

RSpec.describe ExtraCourse, :type => :model do
  describe "Validations" do
		it 'should be invalid if there is no fancy name' do
			extra_course = FactoryGirl.build :extra_course, :name => nil
			expect(extra_course).to be_invalid
		end

		it 'should be invalid if there is no local name' do
			extra_course = FactoryGirl.build :extra_course, :local => nil
			expect(extra_course).to be_invalid
		end

		it 'should be invalid if there is no description' do
			extra_course = FactoryGirl.build :extra_course, :description => nil
			expect(extra_course).to be_invalid
		end

		it "object created is valid" do
			extra_course = FactoryGirl.build(:extra_course)
			expect(extra_course).to be_valid
		end
  end

  describe "Associations" do
  	it { should belong_to(:candidate) }
  end
end
