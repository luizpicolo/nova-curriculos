class CandidatesController < ApplicationController
  before_filter :authenticate_user!, except: [:new]
  before_action :set_candidate, only: [:update]

  def new
  end

  def show
  	candidate = Candidate.find_by_user_id(current_user)
  	if candidate.nil?
	  @candidate = Candidate.new
  	else
  	  @candidate = candidate
  	end
  end

  def create
  	@candidate = Candidate.new(candidate_params)
	  #@candidate.is_male = true
	  #@candidate.bith_date = "1981-07-05"
  	@candidate.user = current_user
  	if @candidate.save
  	  redirect_to curriculum_candidate_path, :flash => { :notice => "Seus dados foram atualizados com sucesso." }
  	else
  	  redirect_to curriculum_candidate_path, :flash => { :error => "Erro ao atualizar dados. Verifique os campos e tente novamente." }
  	end
    end

  def update
  	if @candidate.update(candidate_params)
	    redirect_to curriculum_candidate_path, :flash => { :notice => "Seus dados foram atualizados com sucesso" }
  	else
  	  redirect_to curriculum_candidate_path, :flash => { :error => "Erro ao atualizar dados. Verifique os campos e tente novamente." }
  	end
  end

  private

  def set_candidate
    @candidate = Candidate.find_by_user_id(current_user)
  end

  def candidate_params
    params.require(:candidate).permit(
      :full_name, :is_male, :birth_date, :street,
      :number, :complement, :suburb, :city_id
    )
  end
end
