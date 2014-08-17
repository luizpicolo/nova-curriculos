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
  	city = create_city

  	visit curriculum_candidate_path

	  fill_in "candidate_full_name", with: full_name
    choose "candidate_is_male_true" if is_male == true
    choose "candidate_is_male_false" if is_male == false
  	fill_in "candidate_birth_date", with: birth_date
  	select city.name, :from => "candidate_city_id"
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

  def update_academic_training(candidate)
    updating_information candidate

    academic_training = create_academic_training
    schooling = create_schooling

    visit curriculum_candidate_path

    select schooling.name, :from => "academic_training_schooling_id"
    fill_in "academic_training_name_of_course", with: academic_training.name_of_course
    fill_in "academic_training_institution", with: academic_training.institution
    fill_in "academic_training_start_date", with: academic_training.start_date
    fill_in "academic_training_finish_date", with: academic_training.finish_date
    click_button "Salvar formação acadêmica"

    academic_training
  end

  def destroy_academic_training(candidate)
    academic_training = update_academic_training candidate

    click_link "Excluir"
  end

  def create_professional_area
    FactoryGirl.create(:professional_area)
  end

  def create_city
    FactoryGirl.create(:city)
  end

  def create_academic_training
    FactoryGirl.create(:academic_training)
  end

  def create_schooling
    FactoryGirl.create(:schooling)
  end

  def create_hierarchical_level
    FactoryGirl.create(:hierarchical_level)
  end
end

RSpec.configure do |config|
  config.include CandidateHelpers, :type => :feature
end
