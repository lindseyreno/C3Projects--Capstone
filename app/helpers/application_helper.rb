module ApplicationHelper
  def pretty_date(date)
    date.strftime("%A, %b %d")
  end
end
