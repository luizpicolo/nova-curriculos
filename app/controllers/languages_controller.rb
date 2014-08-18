class LanguagesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_language, only: [:update]

  def create
    @language = Language.new(language_params)
    @language.candidate = current_user.candidate
    if @language.save
      redirect_to curriculum_candidate_path, :flash => { :notice => "Seus dados foram atualizados com sucesso." }
    else
      error_msg = ""
      @language.errors.full_messages.each do |msg|
        error_msg << "<div>#{msg}</div>"
      end
      redirect_to curriculum_candidate_path, :flash => { :error => error_msg }
    end
  end

  def update
    if @language.update(language_params)
      redirect_to curriculum_candidate_path, :flash => { :notice => "Seus dados foram atualizados com sucesso" }
    else
      error_msg = ""
      @language.errors.full_messages.each do |msg|
        error_msg << "<div>#{msg}</div>"
      end
      redirect_to curriculum_candidate_path, :flash => { :error => error_msg }
    end
  end

  def destroy
    language = Language.find(params[:id])
    unless language.candidate == current_user
      language.destroy
      redirect_to curriculum_candidate_path, :notice => 'Curso extra/evento deletado com sucesso.'
    else
      error_msg = ""
      @language.errors.full_messages.each do |msg|
        error_msg << "<div>#{msg}</div>"
      end
      redirect_to curriculum_candidate_path, :flash => { :error => error_msg }
    end
  end

  private

  def set_language
    @language = Language.find(language_params[:id])
  end

  def language_params
    params.require(:language).permit(
      :speech, :level, :id
    )
  end
end
