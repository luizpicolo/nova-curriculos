require 'rails_helper'

RSpec.describe Candidate, :type => :model do

	include CarrierWave::Test::Matchers

	# before do
	# 	file = FactoryGirl.build :candidate
	# 	ImageUploader.enable_processing = true
	# 	@uploader = ImageUploader.new(Candidate.new, :image)
	# 	@uploader.store!(file.image)
	# end

	# after do
	# 	ImageUploader.enable_processing = false
	# 	@uploader.remove!
	# end

  describe "Validations" do
    it 'should be invalid if there is no name' do
			candidate = FactoryGirl.build :candidate, :full_name => nil
			expect(candidate).to be_invalid
		end

		it 'should be invalid if there is no sex' do
			candidate = FactoryGirl.build :candidate, :is_male => nil
			expect(candidate).to be_invalid
		end

		it 'should be invalid if there is no birth date' do
			candidate = FactoryGirl.build :candidate, :birth_date => nil
			expect(candidate).to be_invalid
		end

		it 'should be invalid if there is no user association' do
			candidate = FactoryGirl.build :candidate, :user => nil
			expect(candidate).to be_invalid
		end

		it 'should be invalid if there is no message phone' do
			candidate = FactoryGirl.build :candidate, :message_phone => nil
			expect(candidate).to be_invalid
		end

		# it 'should be invalid if there is no mini curriculum' do
		# 	candidate = FactoryGirl.build :candidate, :mini_curriculum => nil
		# 	expect(candidate).to be_invalid
		# end

		it "object created is valid" do
			candidate = FactoryGirl.build(:candidate)
			expect(candidate).to be_valid
		end
  end

  describe "Delegate" do
  	it "should delegate name for a user" do
  		candidate = FactoryGirl.build(:candidate)
  		expect(candidate.name).to eq(candidate.user.name)
  	end
  end

	# Local Uploads
	# describe "Uploader" do
	# 	it "should make the image readable only to the owner and not executable" do
	# 		expect(@uploader).to have_permissions(0644)
	# 	end
	# end

  describe "Association" do
  	it { should have_many(:professional_experiences) }
  	it { should have_many(:academic_trainings) }
  	it { should have_many(:languages) }
  	it { should have_many(:extra_courses) }

  	it { should have_and_belong_to_many(:professional_areas) }
  	it { should have_and_belong_to_many(:hierarchical_levels) }

  	it { should belong_to(:city) }
  	it { should belong_to(:user) }
  end

	describe "Avatar" do
		it "should return valid path for image" do
			candidate = FactoryGirl.build(:candidate)
			expect(candidate.avatar("thumb")).to eq("/assets/thumb_icon-avatar.jpg")
			expect(candidate.avatar("thumb_min")).to eq("/assets/thumb_min_icon-avatar.jpg")
		end
	end
end
