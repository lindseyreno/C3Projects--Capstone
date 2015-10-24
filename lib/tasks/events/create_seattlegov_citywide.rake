require 'create_seattlegov_citywide_events'
require 'parse_seattlegov_citywide'
require 'assign_categories'

namespace :events do
  desc 'Creates events and associates categories from seattlegov citywide feed'
  task create_seattlegov_citywide: :environment do
    CreateSeattlegovCitywideEvents.create_seattlegov_citywide_events
  end
end
