require 'rails_helper'

RSpec.describe TypeCompany, :type => :model do
   describe "Validations" do
		it 'should be invalid if there is no name' do
			type_company = FactoryGirl.build :type_company, :name => nil
			expect(type_company).to be_invalid
		end

		it "object created is valid" do
			type_company = FactoryGirl.build(:type_company)
			expect(type_company).to be_valid
		end
  end

  describe "Associations" do
  	it { should have_many(:company) }
  end
end
