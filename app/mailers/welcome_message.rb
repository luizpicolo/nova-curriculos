class WelcomeMailer < ActionMailer::Base
  default from: "noreply@novacurriculos.com.br"

  def welcome_message_candidate(contact)
    @contact = contact
    mail(:to => @contact.email, :subject => 'Mensagem de Boas Vindas')
  end

  def welcome_message_company(contact)
    @contact = contact
    mail(:to => @contact.email, :subject => 'Mensagem de Boas Vindas')
  end
end
