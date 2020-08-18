class AdminNotifierMailer < ApplicationMailer
  default from: 'not-cool@tarmac.io'

  def send_complaint_notifications(complaint)
    @complaint = complaint
    mail(to: User.where(admin: true).map(&:email),
         subject: 'New complaint received')
  end
end
