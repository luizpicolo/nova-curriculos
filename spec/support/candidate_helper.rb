module CandidateHelpers

  def initialize
    @user = FactoryGirl.create(:user)
    @city = FactoryGirl.create(:city)
  end

  def updating_data(candidate, is_male = true)
  	sign_in @user
  	visit curriculum_candidate_path

	fill_in "candidate_full_name", with: candidate.full_name
	if is_male
		choose "candidate_is_male_true"
	else
		choose "candidate_is_male_false"
	end
	fill_in "candidate_birth_date", with: candidate.birth_date
	#select "candidate_city_id", :from => @city.name
	fill_in "candidate_mobile_phone", with: candidate.mobile_phone 
	fill_in "candidate_message_phone", with: candidate.message_phone 
	click_button "Salvar dados do candidato"
  end  
end

RSpec.configure do |config|
  config.include CandidateHelpers, :type => :feature
end
