class CreateSeattlegovCitywideEventRecords
  def self.create_seattlegov_citywide_events
    ParseSeattlegovCitywide.parse_rss.each do |event|
      begin
        Event.create(event)
      rescue ActiveRecord::RecordNotUnique
        next
      end
      begin
        if created_event = Event.find_by(event)
          AssignCategories.assign_categories(created_event)
        end
      rescue ActiveRecord::RecordNotUnique
        next
      end
    end
  end
end


# stuff.each do |h|
#   begin
#     Model.create(h)
#   rescue ActiveRecord::RecordNotUnique => e
#     next if(e.message =~ /unique.*constraint.*INDEX_NAME_GOES_HERE/)
#     raise
#   end
# end