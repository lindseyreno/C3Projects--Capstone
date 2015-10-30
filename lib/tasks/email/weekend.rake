namespace :email do
  desc 'Emails weekend events newsletter'
  task weekend: :environment do
    if Date.today.wednesday?
      users = User.weekend
      users.each do |user|
        UserMailer.newsletter(user, 'weekend').deliver_now
      end
    end
  end
end
