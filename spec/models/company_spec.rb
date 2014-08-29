require 'rails_helper'

RSpec.describe Company, :type => :model do

	include CarrierWave::Test::Matchers

	before do
		file = FactoryGirl.build :company
		LogoUploader.enable_processing = true
		@uploader = LogoUploader.new(Candidate.new, :logo)
		@uploader.store!(file.logo)
	end

	after do
		LogoUploader.enable_processing = false
		@uploader.remove!
	end

  describe "Validations" do
		it 'should be invalid if there is no fancy name' do
			company = FactoryGirl.build :company, :fancy_name => nil
			expect(company).to be_invalid
		end

		it 'should be invalid if there is no corporate name' do
			company = FactoryGirl.build :company, :corporate_name => nil
			expect(company).to be_invalid
		end

		it 'should be invalid if there is no phone' do
			company = FactoryGirl.build :company, :phone => nil
			expect(company).to be_invalid
		end

		it 'should be invalid if there is no type company' do
			company = FactoryGirl.build :company, :type_company => nil
			expect(company).to be_invalid
		end

		it 'should be invalid if there is no cnpj' do
			company = FactoryGirl.build :company, :cnpj => nil
			expect(company).to be_invalid
		end

		it 'should be invalid if there is no description' do
			company = FactoryGirl.build :company, :description => nil
			expect(company).to be_invalid
		end

		it 'should be invalid if there is no city' do
			company = FactoryGirl.build :company, :city => nil
			expect(company).to be_invalid
		end

		it 'should be invalid if there is no user' do
			company = FactoryGirl.build :company, :user => nil
			expect(company).to be_invalid
		end

		it "object created is valid" do
			company = FactoryGirl.build(:company)
			expect(company).to be_valid
		end
  end

  # Local Uploads
	# describe "Uploader" do
	# 	it "should make the image readable only to the owner and not executable" do
	# 		expect(@uploader).to have_permissions(0644)
	# 	end
	# end

  describe "Associations" do
  	it { should have_and_belong_to_many(:branch_operations) }
  	it { should belong_to(:type_company) }
  	it { should belong_to(:city) }
  	it { should belong_to(:user) }

  	it { should have_many(:jobs) }
  end

	describe "Logo marca" do
		it "should return valid path for logo marca" do
			company = FactoryGirl.build(:company)
			expect(company.logo_marca("thumb")).to eq("/assets/thumb_avatar.jpg")
			expect(company.logo_marca("thumb_min")).to eq("/assets/thumb_min_avatar.jpg")
		end
	end
end
