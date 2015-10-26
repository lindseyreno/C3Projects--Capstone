namespace :email do
  desc 'Emails daily events newsletter'
  task everyday: :environment do
    users = User.everyday
    users.each do |user|
      UserMailer.newsletter(user, "everyday").deliver_now
      puts user.username
    end
  end
end
