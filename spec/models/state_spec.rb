require 'rails_helper'

RSpec.describe State, :type => :model do
  describe "Validations" do
		it 'should be invalid if there is no name' do
			state = FactoryGirl.build :state, :name => nil
			expect(state).to be_invalid
		end

		it "object created is valid" do
			state = FactoryGirl.build(:state)
			expect(state).to be_valid
		end
  end

  describe "Associations" do
  	it { should belong_to(:country) }
  end
end
