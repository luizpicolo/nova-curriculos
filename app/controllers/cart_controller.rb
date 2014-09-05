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

    premium_plan = PremiumPlan.all

    @order_one.add :id => params[:id], :price => premium_plan[0].price, :description => "Compra vaga premium por 1 mes. Valor:  #{premium_plan[0].price}"
    @order_two.add :id => params[:id], :price => premium_plan[1].price, :description => "Compra vaga premium por 2 mes. Valor: #{premium_plan[0].price}"
    @order_three.add :id => params[:id], :price => premium_plan[2].price, :description => "Compra vaga premium por 3 mes. Valor: #{premium_plan[0].price}"
  end

  def confirm
    return unless request.post?

    pagseguro_notification do |notification|
      invoice = Invoice.find(notification.order_id);
      invoice.status = notification.status
      invoice.payment_method = notification.payment_method
      invoice.save
    end

    render :nothing => true
  end

  def sucess
  end
end
