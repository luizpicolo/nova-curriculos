class JobsController < ApplicationController
  before_action :authenticate_user!
  
  def show
  	@jobs = Job.all
  	@job = Job.find_by_slug(params[:slug])
  end
end
