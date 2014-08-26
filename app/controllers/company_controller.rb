class CompanyController < ApplicationController
 before_filter :authenticate_user!

 def show
   @company = Company.find_by_user_id(current_user)
 end
end
