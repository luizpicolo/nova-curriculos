class ExtraCoursesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_extra_course, only: [:update]

  def create
    @extra_course = ExtraCourse.new(extra_course_params)
    @extra_course.candidate = current_user.candidate
    if @extra_course.save
      redirect_to curriculum_candidate_path, :flash => { :notice => "Seus dados foram atualizados com sucesso." }
    else
      error_msg = ""
      @extra_course.errors.full_messages.each do |msg|
        error_msg << "<div>#{msg}</div>"
      end
      redirect_to curriculum_candidate_path, :flash => { :error => error_msg }
    end
  end

  def update
    if @extra_course.update(extra_course_params)
      redirect_to curriculum_candidate_path, :flash => { :notice => "Seus dados foram atualizados com sucesso" }
    else
      error_msg = ""
      @extra_course.errors.full_messages.each do |msg|
        error_msg << "<div>#{msg}</div>"
      end
      redirect_to curriculum_candidate_path, :flash => { :error => error_msg }
    end
  end

  def destroy
    extra_course = ExtraCourse.find(params[:id])
    unless extra_course.candidate == current_user
      extra_course.destroy
      redirect_to curriculum_candidate_path, :notice => 'Curso extra/evento deletado com sucesso.'
    else
      error_msg = ""
      @extra_course.errors.full_messages.each do |msg|
        error_msg << "<div>#{msg}</div>"
      end
      redirect_to curriculum_candidate_path, :flash => { :error => error_msg }
    end
  end

  private

  def set_extra_course
    @extra_course = ExtraCourse.find(extra_course_params[:id])
  end

  def extra_course_params
    params.require(:extra_course).permit(
      :name, :local, :description, :id
    )
  end
end
