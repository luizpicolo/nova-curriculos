class ContractorsController < ApplicationController
  def new
    unless current_user.nil?
      redirect_to root_path, :flash => { :notice => "Deslogue-se para cadastrar um novo usuário" }
    end
  end
end
