class CreateSeattlegovCitywideEvents
  def self.create_seattlegov_citywide_events
    ParseSeattlegovCitywide.parse_rss.each do |event|
      begin
        Event.create(event)
      rescue ActiveRecord::RecordNotUnique
        next
      end
      begin
        if Event.find_by(event)
          created_event = Event.find_by(event)
          AssignCategories.assign_categories(created_event)
        end
      rescue ActiveRecord::RecordNotUnique
        next
      end
    end
  end
end
