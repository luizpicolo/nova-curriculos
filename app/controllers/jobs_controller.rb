class JobsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    company = Company.find_by_user_id(current_user)
    if company.nil?
      redirect_to root_path, :flash => { :error => "Por favor, atualize os dados de sua empresa antes de cadastrar uma vaga" }
    else
      @company = company
    end
    @job = Job.new
  end

  def create
    company = Company.find_by_user_id(current_user)
    @job = Job.new(job_params)
    @job.company = company
    @job.start_date = Time.now
    @job.finish_data = Time.now + 30.days
    if @job.save
      redirect_to new_vacancy_path, :flash => { :notice => "Vaga cadastrada com sucesso." }
    else
      error_msg = ""
      @job.errors.full_messages.each do |msg|
        error_msg << "<div>#{msg}</div>"
      end
      redirect_to new_vacancy_path, :flash => { :error => error_msg }
    end
  end

  def show
  	@jobs = Job.all
  	@job = Job.find_by_slug(params[:slug])
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(
      :job_title, :salary_range, :type_contract,
      :job_category, :amount_vacancies, :time_contract,
      :description, :requirements, :period_of_work,
      :city, :salary_negotiable, :is_premium, :status
    )
  end
end
