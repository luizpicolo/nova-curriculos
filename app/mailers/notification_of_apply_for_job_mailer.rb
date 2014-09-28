class NotificationOfApplyForJobMailer < ActionMailer::Base
  include Sidekiq::Worker
  default from: "noreply@novacurriculos.com.br"

  def message_for_company(candidate, job)
    @candidate = candidate
    @job = job
    mail(
      :to => @job.company.user.email,
      :from => "noreply@novacurriculos.com.br",
      :subject => 'Você recebeu um candidato para sua vaga'
    )
  end
end
