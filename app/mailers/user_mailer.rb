class UserMailer < ActionMailer::Base
  default from: "luizpicolo@gmail.com"

  def welcome_email(user)
    mail(:to => user.email, :subject => 'Mensagem de Contato')
  end
end
