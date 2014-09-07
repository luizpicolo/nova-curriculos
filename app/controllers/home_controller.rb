class HomeController < ApplicationController
  def index
    @jobs_categories = JobCategory.all

    puts params[:lastmsg]

  	# Search Solr
    @search = Job.search do
      with(:start_date).less_than_or_equal_to(Time.now.strftime("%Y-%m-%d").to_date)
      with(:finish_date).greater_than_or_equal_to(Time.now.strftime("%Y-%m-%d").to_date)
      with(:status, true)
      paginate :page => 1, :per_page => 15
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

  def pagination_more
    render layout: false
    puts params[:lastmsg]

    # Search Solr
    @search = Job.search do
      with(:start_date).less_than_or_equal_to(Time.now.strftime("%Y-%m-%d").to_date)
      with(:finish_date).greater_than_or_equal_to(Time.now.strftime("%Y-%m-%d").to_date)
      with(:status, true)
      paginate :page => 1, :per_page => 15
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
    return @jobs;
  end
end
