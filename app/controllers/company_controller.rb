class CompanyController < ApplicationController
 before_filter :authenticate_user!
 before_action :set_company, only: [:update]

 def show
   company =  Company.find_by_user_id(current_user)
   company.nil? ? @company = Company.new : @company = company
 end

 def create
   @company = Company.new(company_params)
   @company.user = current_user
   if @company.save
     redirect_to company_path, :flash => { :notice => "Seus dados foram atualizados com sucesso." }
   else
     error_msg = ""
     @company.errors.full_messages.each do |msg|
       error_msg << "<div>#{msg}</div>"
     end
     redirect_to company_path, :flash => { :error => error_msg }
   end
 end

 def update
   if @company.update(company_params)
     redirect_to company_path, :flash => { :notice => "Seus dados foram atualizados com sucesso" }
   else
     error_msg = ""
     @company.errors.full_messages.each do |msg|
       error_msg << "<div>#{msg}</div>"
     end
     redirect_to company_path, :flash => { :error => error_msg }
   end
 end

 private

 def set_company
   @company = Company.find_by_user_id(current_user)
 end

 def company_params
   params.require(:company).permit(
     :fancy_name, :corporate_name, :phone, :street, :lt, :lg,
     :number, :facebook, :website, :type_company_id, :cnpj,
     :city_id, :description, :email, :logo,
     :twitter, {:branch_operation_ids => []}
   )
 end
end
