class NotificationsMailer < ApplicationMailer
  def created(notification, emails)
    @text = notification.text

    mail(
      bcc: emails,
      subject: notification.subject
    )
  end
end
