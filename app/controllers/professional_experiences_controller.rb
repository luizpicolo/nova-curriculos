class ProfessionalExperiencesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_professional_experiences, only: [:update]

  def create
    @professional_experiences = ProfessionalExperience.new(professional_experiences_params)
    @professional_experiences.candidate = current_user.candidate
    if @professional_experiences.save
      redirect_to show_curriculum_candidate_path, :flash => { :notice => "Seus dados foram atualizados com sucesso." }
    else
      error_msg = ""
      @professional_experiences.errors.full_messages.each do |msg|
        error_msg << "<div>#{msg}</div>"
      end
      redirect_to show_curriculum_candidate_path, :flash => { :error => error_msg }
    end
  end

  def update
    if @professional_experiences.update(professional_experiences_params)
      redirect_to show_curriculum_candidate_path, :flash => { :notice => "Seus dados foram atualizados com sucesso" }
    else
      error_msg = ""
      @professional_experiences.errors.full_messages.each do |msg|
        error_msg << "<div>#{msg}</div>"
      end
      redirect_to show_curriculum_candidate_path, :flash => { :error => error_msg }
    end
  end

  def destroy
    professional_experiences = ProfessionalExperience.find(params[:id])
    unless professional_experiences.candidate == current_user
      professional_experiences.destroy
      redirect_to show_curriculum_candidate_path, :notice => 'Curso extra/evento deletado com sucesso.'
    else
      error_msg = ""
      @professional_experiences.errors.full_messages.each do |msg|
        error_msg << "<div>#{msg}</div>"
      end
      redirect_to show_curriculum_candidate_path, :flash => { :error => error_msg }
    end
  end

  private

  def set_professional_experiences
    @professional_experiences = ProfessionalExperience.find(professional_experiences_params[:id])
  end

  def professional_experiences_params
    params.require(:professional_experience).permit(
      :name_company, :last_post, :start_date, :finish_date,
      :attributions, :jobs_current, :id
    )
  end
end
