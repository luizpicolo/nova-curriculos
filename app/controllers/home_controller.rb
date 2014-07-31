class HomeController < ApplicationController
  def index
  	time_now = Time.now.strftime("%Y-%m-%d")
  	@jobs = Job.where("start_date <= ?", time_now).where("finish_date >= ?", time_now)
  end
end
