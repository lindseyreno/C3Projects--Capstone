class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@myseattleevents.com'
  layout 'mailer'
  helper MailerHelper
end
