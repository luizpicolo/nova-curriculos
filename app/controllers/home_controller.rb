class HomeController < ApplicationController
  def index
    @jobs_categories = JobCategory.all
  	
    time_now = Time.now.strftime("%Y-%m-%d")
  	
  	# Search Solr
    @search = Job.where("start_date <= ?", time_now).where("finish_date >= ?", time_now).search do
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
