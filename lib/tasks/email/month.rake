namespace :email do
  desc 'Emails monthly events newsletter'
  task month: :environment do
    date = Date.today
    if date == date.end_of_month
      users = User.weekend
      users.each do |user|
        UserMailer.newsletter(user, 'month').deliver_now
      end
    end
  end
end
