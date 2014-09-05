class CartController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def checkout
    # Busca o pedido associado ao usuario; esta logica deve
    # ser implementada por voce, da maneira que achar melhor
    @client = current_user

    # Instanciando o objeto para geracao do formulario
    @order_one   = PagSeguro::Order.new(@client.id)
    @order_two   = PagSeguro::Order.new(@client.id)
    @order_three = PagSeguro::Order.new(@client.id)

    hash = {
      :name                  => @client.company.corporate_name,
      :email                 => @client.email,
      :address_zipcode       => "79750-000",
      :address_street        => @client.company.street,
      :address_number        => @client.company.number,
      :address_city          => @client.company.city.name,
      :address_state         => @client.company.city.state.iso,
      :address_country       => @client.company.city.state.country.name,
      :phone_area_code       => "67",
      :phone_number          => @client.company.phone
    }

    @order_one.billing = hash
    @order_two.billing = hash
    @order_three.billing = hash

    @order_one.add :id => params[:id], :price => "29,90", :description => "Fatura de 29,90"
    @order_two.add :id => params[:id], :price => "39,90", :description => "Fatura de 39,90"
    @order_three.add :id => params[:id], :price => "49,90", :description => "Fatura de 49,90"
  end

  def confirm
    return unless request.post?

    pagseguro_notification do |notification|
      # Aqui voce deve verificar se o pedido possui os mesmos produtos
      # que voce cadastrou. O produto soh deve ser liberado caso o status
      # do pedido seja "completed" ou "approved"
    end

    render :nothing => true
  end

  def sucess
  end
end
