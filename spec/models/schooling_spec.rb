require 'rails_helper'

RSpec.describe Schooling, :type => :model do
  describe "Validations" do
    it 'should be invalid if there is no name' do
      schooling = FactoryGirl.build :schooling, :name => nil
      expect(schooling).to be_invalid
    end

    it "object created is valid" do
      schooling = FactoryGirl.build(:schooling)
      expect(schooling).to be_valid
    end
  end

  describe "Associations" do
    it { should have_many(:academic_trainings) }
  end
end
