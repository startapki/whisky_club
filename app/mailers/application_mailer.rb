class ApplicationMailer < ActionMailer::Base
  layout 'mailer'

  helper :markdown
end
