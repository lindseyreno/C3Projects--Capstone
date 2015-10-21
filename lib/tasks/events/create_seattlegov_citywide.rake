require 'create_seattlegov_citywide_events'
require 'parse_seattlegov_citywide'
require 'assign_categories'

namespace :events do
  desc 'Creates new events and associates categories from seattlegov city wide RSS feed'
  task create_seattlegov_citywide: :environment do
    CreateSeattlegovCitywideEvents.create_seattlegov_citywide_events
  end
end
