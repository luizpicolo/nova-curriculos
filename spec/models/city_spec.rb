require 'rails_helper'

RSpec.describe City, :type => :model do
  describe "Validations" do
		it 'should be invalid if there is no name' do
			city = FactoryGirl.build :city, :name => nil
			expect(city).to be_invalid
		end

		it "object created is valid" do
			city = FactoryGirl.build(:city)
			expect(city).to be_valid
		end
  end

  describe "Associations" do
  	it { should belong_to(:state) }
  end
end
