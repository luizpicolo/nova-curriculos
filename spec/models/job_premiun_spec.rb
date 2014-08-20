require 'rails_helper'

RSpec.describe JobPremiun, :type => :model do
  describe "Validations" do
    it 'should be invalid if there is no start date' do
      job_premiun = FactoryGirl.build :job_premiun, :start_date => nil
      expect(job_premiun).to be_invalid
    end

    it 'should be invalid if there is no finish date' do
      job_premiun = FactoryGirl.build :job_premiun, :finish_date => nil
      expect(job_premiun).to be_invalid
    end

    it "object created is valid" do
      job_premiun = FactoryGirl.build(:job_premiun)
      expect(job_premiun).to be_valid
    end
  end

  describe "#validate_date" do
    it "should return true with valid interval between dates" do
      job_premiun = FactoryGirl.build :job_premiun, :start_date => (Time.now - 2.days), :finish_date => (Time.now + 2.days)
      expect(job_premiun.validate_date).to be(true)
    end

    it "should return false with interval between dates greater than the current date" do
      job_premiun = FactoryGirl.build :job_premiun, :start_date => (Time.now + 2.days), :finish_date => (Time.now + 2.days)
      expect(job_premiun.validate_date).to be(false)
    end

    it "should return false with interval between dates less than the current date" do
      job_premiun = FactoryGirl.build :job_premiun, :start_date => (Time.now - 2.days), :finish_date => (Time.now - 2.days)
      expect(job_premiun.validate_date).to be(false)
    end
  end

  describe "Associations" do
    it { should belong_to(:job) }
  end
end
