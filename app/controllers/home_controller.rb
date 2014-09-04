class HomeController < ApplicationController
  def index
    @jobs_categories = JobCategory.all

    time_now = Time.zone.now - 1.day

  	# Search Solr
    @search = Job.search do
      with(:start_date).less_than(time_now.strftime("%Y-%m-%d"))
      with(:finish_date).greater_than(time_now.strftime("%Y-%m-%d"))
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
  end
end
