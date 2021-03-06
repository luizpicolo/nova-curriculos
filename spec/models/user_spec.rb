require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "Validations" do
		it 'should be invalid if there is no mail' do
			user = FactoryGirl.build :user, :email => nil
			expect(user).to be_invalid
		end

		it 'should be invalid if there is no password' do
			user = FactoryGirl.build :user, :password => nil
			expect(user).to be_invalid
		end

		it "object created is valid" do
			user = FactoryGirl.build(:user)
			expect(user).to be_valid
		end
  end

  describe "Associations" do
  	it { should have_one(:candidate) }
  	it { should have_one(:company) }
  end

  describe "#is_company?" do
    it 'should be false not this is candidate' do
      user = FactoryGirl.build :user, :is_candidate => false
      expect(user.is_company?).to be(true)
    end

    it 'should be false this is candidate' do
      user = FactoryGirl.build :user, :is_candidate => true
      expect(user.is_company?).to be(false)
    end
  end
end
