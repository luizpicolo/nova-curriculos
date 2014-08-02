class HomeController < ApplicationController
  def index
  	@jobs_categories = JobCategory.all
  	
  	time_now = Time.now.strftime("%Y-%m-%d")
  	#@list = Job.where("start_date <= ?", time_now).where("finish_date >= ?", time_now)
  	
  	# Search Solr
  	@search = Job.where("start_date <= ?", time_now).where("finish_date >= ?", time_now).search do
  	  fulltext params[:search] do
  	  	fields(:company, :job_title, :job_category)
  	  end
  	end

  	@jobs = @search.results
  end
end
