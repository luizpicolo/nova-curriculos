require 'rails_helper'

RSpec.describe Language, :type => :model do
  describe "Validations" do
		it 'should be invalid if there is no name language' do
			language = FactoryGirl.build :language, :speech => nil
			expect(language).to be_invalid
		end

		it 'should be invalid if there is no level' do
			language = FactoryGirl.build :language, :level => nil
			expect(language).to be_invalid
		end

		it "object created is valid" do
			language = FactoryGirl.build(:language)
			expect(language).to be_valid
		end
  end

  describe "Associations" do
  	it { should belong_to(:candidate) }
  end
end
