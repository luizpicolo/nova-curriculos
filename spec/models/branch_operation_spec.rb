require 'rails_helper'

RSpec.describe BranchOperation, :type => :model do
  describe "Validations" do
		it 'should be invalid if there is no name' do
			branch_operation = FactoryGirl.build :branch_operation, :name => nil
			expect(branch_operation).to be_invalid
		end

		it "object created is valid" do
			branch_operation = FactoryGirl.build(:branch_operation)
			expect(branch_operation).to be_valid
		end
  end

  describe "Associations" do
  	it { should have_and_belong_to_many(:companies) }
  end
end
