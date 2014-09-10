class WelcomeMailer < ActionMailer::Base
  include Sidekiq::Worker
  default from: "noreply@novacurriculos.com.br"

  def welcome_message_candidate(id)
    contact = User.find(id)
    @contact = contact
    mail(:to => contact.email, :subject => 'Mensagem de Boas Vindas')
  end

  def welcome_message_company(id)
    contact = User.find(id)
    @contact = contact
    mail(:to => contact.email, :subject => 'Mensagem de Boas Vindas')
  end
end
