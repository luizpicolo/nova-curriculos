require 'rails_helper'

RSpec.describe TypeContract, :type => :model do
  describe "Validations" do
		it 'should be invalid if there is no name' do
			type_contract = FactoryGirl.build :type_contract, :name => nil
			expect(type_contract).to be_invalid
		end

		it "object created is valid" do
			type_contract = FactoryGirl.build(:type_contract)
			expect(type_contract).to be_valid
		end
  end

  describe "Associations" do
  	it { should have_many(:jobs) }
  end
end
