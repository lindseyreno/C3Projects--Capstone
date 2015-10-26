namespace :email do
  desc 'Emails every two weeks event newsletter'
  task two_weeks: :environment do
    users = User.two_weeks
    users.each do |user|
      UserMailer.newsletter(user, "two_weeks").deliver_now
    end
  end
end
