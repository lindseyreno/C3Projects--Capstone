# Use this file to easily define all of your cron jobs.

# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Learn more: http://github.com/javan/whenever

set :output, 'log/cron_log.log'

# Adds new events to the db from seattlegov citywide
every :day, :at => '12:15am' do
  rake 'events:create_seattlegov_citywide'
end

# Sends the newsletter everyday to the users with that schedule
every :day, :at => '12:30am' do
  rake 'email:everyday'
end

# Sends the newsletter on Wednesday's to the users who want events for the weekend
every :wednesday, :at => '12:45am' do
  rake 'email:weekend'
end

# Sends the newsletter on Sunday's for users who want events for the week
every :sunday, :at => '1am' do
  rake 'email:week'
end

# Sends the newsletter on Sunday's for the users who want events every two weeks

# Sends the newsletter on the first of the month for users who want events for the month
every :month do
  rake 'email:month'
end
