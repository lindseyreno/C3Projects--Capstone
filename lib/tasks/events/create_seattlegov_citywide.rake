require 'create_seattlegov_citywide_event_records'
require 'parse_seattlegov_citywide'
require 'create_category_associations'

namespace :events do
  desc 'Creates new events and associates categories from RSS feeds'
  task create_seattlegov_citywide: :environment do
    CreateSeattlegovCitywideEventRecords.create_seattlegov_citywide_events
  end
end
