require 'rails_helper'

RSpec.describe ProfessionalArea, :type => :model do
  describe "Validations" do
		it 'should be invalid if there is no name' do
			professional_area = FactoryGirl.build :professional_area, :name => nil
			expect(professional_area).to be_invalid
		end

		it "object created is valid" do
			professional_area = FactoryGirl.build(:professional_area)
			expect(professional_area).to be_valid
		end
  end

  describe "Associations" do
  	it { should have_and_belong_to_many(:candidates) }
  end
end
