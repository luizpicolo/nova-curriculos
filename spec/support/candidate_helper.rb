module CandidateHelpers

  def initialize
    @user = FactoryGirl.create(:user)
  end

  def updating_information(candidate, is_male = true, options = {})
  	full_name = options[:full_name] || candidate.full_name
    birth_date = options[:birth_date] || candidate.birth_date
    mobile_phone = options[:mobile_phone] || candidate.mobile_phone
    message_phone = options[:message_phone] || candidate.message_phone

    sign_in @user
  	#city = FactoryGirl.create(:city)

  	visit curriculum_candidate_path

	  fill_in "candidate_full_name", with: full_name
    choose "candidate_is_male_true" if is_male == true
    choose "candidate_is_male_false" if is_male == false
  	fill_in "candidate_birth_date", with: birth_date
  	#select "candidate_city_id", :from => city.id
  	fill_in "candidate_mobile_phone", with: mobile_phone
  	fill_in "candidate_message_phone", with: message_phone
  	click_button "Salvar dados do candidato"
  end

  def update_goal(candidate)
    updating_information candidate

    professional_area = create_professional_area
    hierarchical_level = create_hierarchical_level

    visit curriculum_candidate_path

  	fill_in "candidate_position_of_interest", with: candidate.position_of_interest
    check "candidate_professional_area_ids_#{professional_area.id}"
    check "candidate_hierarchical_level_ids_#{hierarchical_level.id}"
    fill_in "candidate_last_salary", with: candidate.last_salary
    fill_in "candidate_salary_pretension", with: candidate.salary_pretension
    click_button "Salvar objetivo profissional"
  end

  def create_professional_area
    FactoryGirl.create(:professional_area)
  end

  def create_hierarchical_level
    FactoryGirl.create(:hierarchical_level)
  end
end

RSpec.configure do |config|
  config.include CandidateHelpers, :type => :feature
end
