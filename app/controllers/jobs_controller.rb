class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
    company = Company.find_by_user_id current_user
    @jobs = Job.where "company_id = ?", company
  end

  def new
    company = Company.find_by_user_id current_user
    if company.nil?
      redirect_to company_path, :flash => { :error => "Por favor, atualize os dados de sua empresa antes de cadastrar uma vaga" }
    else
      @company = company
    end
    @job = Job.new
  end

  def edit
    @company = Company.find_by_user_id current_user
    @job = Job.find params[:id]
  end

  def create
    company = Company.find_by_user_id(current_user)
    @job = Job.new(job_params)
    @job.company = company
    @job.start_date = Time.zone.now
    @job.finish_date = Time.zone.now + 30.days
    if @job.save
      redirect_to jobs_path, :flash => { :notice => "Vaga cadastrada com sucesso." }
    else
      error_msg = ""
      @job.errors.full_messages.each do |msg|
        error_msg << "<div>#{msg}</div>"
      end
      redirect_to jobs_path, :flash => { :error => error_msg }
    end
  end

  def update
    @job.status = false
    if @job.update(job_params)
      redirect_to jobs_path, :flash => { :notice => "Vaga atualizada com sucesso" }
    else
      error_msg = ""
      @job.errors.full_messages.each do |msg|
        error_msg << "<div>#{msg}</div>"
      end
      redirect_to jobs_path, :flash => { :error => error_msg }
    end
  end

  def show
  	@jobs = Job.all
  	@job = Job.find_by_slug(params[:slug])
  end

  def destroy
    company = Company.find_by_user_id(current_user)
    if company.user_id == current_user.id
      if @job.destroy
        redirect_to jobs_path, :notice => 'Vaga deletada com sucesso.'
      else
        error_msg = ""
        @job.errors.full_messages.each do |msg|
          error_msg << "<div>#{msg}</div>"
        end
        redirect_to jobs_path, :flash => { :error => error_msg }
      end
    end
  end

  def apply_for_job
    
  end

  private

  def set_job
    if params[:slug]
      @job = Job.find_by_slug(params[:slug])
    else
      @job = Job.find(params[:id])
    end
  end

  def job_params
    params.require(:job).permit(
      :job_title, :salary_range, :type_contract_id,
      :job_category_id, :amount_vacancies, :time_contract,
      :description, :requirements, :period_of_work, :other_information,
      :city_id, :salary_negotiable, :is_premium, :status, :term
    )
  end
end
