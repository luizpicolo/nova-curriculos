class CartController < ApplicationController
  def checkout
    # Busca o pedido associado ao usuario; esta logica deve
    # ser implementada por voce, da maneira que achar melhor
    @invoice = current_user

    # Instanciando o objeto para geracao do formulario
    @order = PagSeguro::Order.new(@invoice.id)

    @order.billing = {
      :name                  => "John Doe",
      :email                 => "john@doe.com",
      :address_zipcode       => "01234-567",
      :address_street        => "Rua Orobo",
      :address_number        => 72,
      :address_complement    => "Casa do fundo",
      :address_neighbourhood => "Tenorio",
      :address_city          => "Pantano Grande",
      :address_state         => "AC",
      :address_country       => "Brasil",
      :phone_area_code       => "22",
      :phone_number          => "1234-5678"
    }

    @order.add :id => 1, :price => "12,00", :description => "teste"

    # adicionando os produtos do pedido ao objeto do formulario
    # @invoice.products.each do |product|
    #   # Estes sao os atributos necessarios. Por padrao, peso (:weight) eh definido para 0,
    #   # quantidade eh definido como 1 e frete (:shipping) eh definido como 0.
    #   @order.add :id => product.id, :price => product.price, :description => product.title
    # end
  end

  def sucess
    
  end
end
