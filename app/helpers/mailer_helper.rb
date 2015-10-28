module MailerHelper
  def pretty_date(date)
    date = Date.parse(date)
    date.strftime("%A, %b %d")
  end
end
