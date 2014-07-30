require 'rails_helper'

RSpec.describe HierarchicalLevel, :type => :model do
  describe "Validations" do
		it 'should be invalid if there is no name' do
			hierarchical_leval = FactoryGirl.build :hierarchical_level, :name => nil
			expect(hierarchical_leval).to be_invalid
		end

		it "object created is valid" do
			hierarchical_leval = FactoryGirl.build(:hierarchical_level)
			expect(hierarchical_leval).to be_valid
		end
  end

  describe "Associations" do
  	it { should have_and_belong_to_many(:candidates) }
  end
end
