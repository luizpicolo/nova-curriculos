require 'rails_helper'

RSpec.describe Country, :type => :model do
  describe "Validations" do
		it 'should be invalid if there is no name' do
			country = FactoryGirl.build :country, :name => nil
			expect(country).to be_invalid
		end

		it "object created is valid" do
			country = FactoryGirl.build(:country)
			expect(country).to be_valid
		end
  end

  describe "Associations" do
  	it { should have_many(:states) }
  end
end
