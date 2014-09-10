class UserMailer < ActionMailer::Base
  include Sidekiq::Worker
  default from: "luizpicolo@gmail.com"

  def welcome_email(user)
    mail(:to => user.email, :subject => 'Mensagem de Contato')
  end
end
