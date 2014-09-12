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
    @job.start_date = Time.now
    @job.finish_date = Time.now + 30.days
    if @job.save
      if job_params[:is_premium]  == "false"
        redirect_to jobs_path, :flash => { :notice => "Vaga cadastrada com sucesso." }
      else
        if create_invoice(company, @job)
          redirect_to cart_checkout_path(@invoice.id)
        else
          redirect_to jobs_path, :flash => { :alert => "Vaga cadastrada com sucesso. Porém sua solicitaçào para vaga premium nào pode ser atendida. Entre em contato pelo email vagapremim@novacurriculo.com.br" }
        end
      end
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
  	# Search Solr
    @search = Job.search do
      with(:start_date).less_than_or_equal_to(Time.now.strftime("%Y-%m-%d").to_date)
      with(:finish_date).greater_than_or_equal_to(Time.now.strftime("%Y-%m-%d").to_date)
      with(:status, true)
      fulltext params[:search] do
        fields(
          :job_title,
          :company_corporate_name,
          :company_fancy_name,
          :description,
          :city,
          :state
        )
      end
      fulltext params[:category] do
        fields(
          :category
        )
      end
      order_by :created_at, :desc
    end

    @jobs = @search.results
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

  private

  def create_invoice(company, job)
    @invoice = Invoice.new
    @invoice.company = company
    @invoice.job = job
    @invoice.save ? true : false
  end

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
