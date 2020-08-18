class AdminNotifierMailer < ApplicationMailer
  default from: 'not-cool@tarmac.io'

  def send_complaint_notifications(complaint)
    @complaint = complaint
    mail(to: User.active_admins.map(&:email),
         subject: 'New complaint received')
  end
end
