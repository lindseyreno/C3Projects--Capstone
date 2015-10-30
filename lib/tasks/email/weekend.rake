namespace :email do
  desc 'Emails weekend events newsletter'
  task weekend: :environment do
    users = User.weekend
    users.each do |user|
      UserMailer.newsletter(user, 'weekend').deliver_now
    end
  end
end
