class CandidatesController < ApplicationController
  before_filter :authenticate_user!, except: [:new]
  before_action :set_candidate, only: [:update]

  def new
    unless current_user.nil?
      redirect_to root_path, :flash => { :notice => "Deslogue-se para cadastrar um novo usuário" }
    end
  end

  def show
  	candidate = Candidate.find_by_user_id(current_user)
    if params[:academic_training_id]
      academic_training = AcademicTraining.find(params[:academic_training_id])
    end
    if params[:extra_course_id]
      extra_course = ExtraCourse.find(params[:extra_course_id])
    end
    if params[:language_id]
      language = Language.find(params[:language_id])
    end
    if params[:professional_experience_id]
      professional_experience = ProfessionalExperience.find(params[:professional_experience_id])
    end

  	candidate.nil? ? @candidate = Candidate.new : @candidate = candidate
    academic_training.nil? ? @academic_training = AcademicTraining.new : @academic_training = academic_training
    extra_course.nil? ? @extra_course = ExtraCourse.new : @extra_course = extra_course
    language.nil? ? @language = Language.new : @language = language
    professional_experience.nil? ? @professional_experience = ProfessionalExperience.new : @professional_experience = professional_experience
  end

  def create
  	@candidate = Candidate.new(candidate_params)
  	@candidate.user = current_user
  	if @candidate.save
  	  redirect_to show_curriculum_candidate_path, :flash => { :notice => "Seus dados foram atualizados com sucesso." }
  	else
      error_msg = ""
      @candidate.errors.full_messages.each do |msg|
        error_msg << "<div>#{msg}</div>"
      end
  	  redirect_to show_curriculum_candidate_path, :flash => { :error => error_msg }
  	end
  end

  def update
  	if @candidate.update(candidate_params)
	    redirect_to show_curriculum_candidate_path, :flash => { :notice => "Seus dados foram atualizados com sucesso" }
  	else
      error_msg = ""
      @candidate.errors.full_messages.each do |msg|
        error_msg << "<div>#{msg}</div>"
      end
  	  redirect_to show_curriculum_candidate_path, :flash => { :error => error_msg }
  	end
  end

  private

  def set_candidate
    @candidate = Candidate.find_by_user_id(current_user)
  end

  def candidate_params
    params.require(:candidate).permit(
      :full_name, :is_male, :birth_date, :street,
      :number, :complement, :suburb, :city_id, :zip_code,
      :home_phone, :commercial_phone, :mobile_phone, :image,
      :message_phone, {:professional_area_ids => []},
      {:hierarchical_level_ids => []}, :position_of_interest,
      :last_salary, :salary_pretension, :salary_to_be_agreed,
      :mini_curriculum, :is_public, :term
    )
  end
end
