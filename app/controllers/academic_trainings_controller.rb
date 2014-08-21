class AcademicTrainingsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_academic_training, only: [:update]

  def create
    @academic_training = AcademicTraining.new(academic_training_params)
    @academic_training.candidate = current_user.candidate
    if @academic_training.save
      redirect_to show_curriculum_candidate_path, :flash => { :notice => "Seus dados foram atualizados com sucesso." }
    else
      error_msg = ""
      @academic_training.errors.full_messages.each do |msg|
        error_msg << "<div>#{msg}</div>"
      end
      redirect_to show_curriculum_candidate_path, :flash => { :error => error_msg }
    end
  end

  def update
    if @academic_training.update(academic_training_params)
      redirect_to show_curriculum_candidate_path, :flash => { :notice => "Seus dados foram atualizados com sucesso" }
    else
      error_msg = ""
      @academic_training.errors.full_messages.each do |msg|
        error_msg << "<div>#{msg}</div>"
      end
      redirect_to show_curriculum_candidate_path, :flash => { :error => error_msg }
    end
  end

  def destroy
    academic_training = AcademicTraining.find(params[:id])
    unless academic_training.candidate == current_user
      academic_training.destroy
      redirect_to show_curriculum_candidate_path, :notice => 'Formação acadêmica deletada com sucesso.'
    else
      error_msg = ""
      @academic_training.errors.full_messages.each do |msg|
        error_msg << "<div>#{msg}</div>"
      end
      redirect_to show_curriculum_candidate_path, :flash => { :error => error_msg }
    end
  end

  private

  def set_academic_training
    @academic_training = AcademicTraining.find(academic_training_params[:id])
  end

  def academic_training_params
    params.require(:academic_training).permit(
      :schooling_id, :name_of_course, :start_date, :finish_date,
      :institution, :id
    )
  end

end
