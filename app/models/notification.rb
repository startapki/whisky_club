class Notification < ActiveRecord::Base
  validates :subject, :text, :emails, presence: true

  before_validation :set_emails
  after_create :deliver

  private

  def set_emails
    self.emails = User.pluck(:email)
  end

  def deliver
    NotificationsMailer.created(self, emails).deliver_later
  end
end
