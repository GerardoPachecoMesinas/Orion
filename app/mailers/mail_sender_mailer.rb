class MailSenderMailer < ApplicationMailer
  def payment_reminder(client_email)
    mail(to: client_email, subject: "Recordatorio de Pago", from: ENV["GMAIL_USER"])
  end
end
