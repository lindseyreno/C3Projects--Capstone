namespace :email do
  desc 'Emails weekly events newsletter'
  task week: :environment do
    users = User.week
    users.each do |user|
      UserMailer.newsletter(user, 'week').deliver_now
    end
  end
end
