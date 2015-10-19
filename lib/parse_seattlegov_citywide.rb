require 'rss'
require 'nokogiri'

class ParseSeattlegovCitywide

  def self.parse_rss
    rss = RSS::Parser.parse('http://www.trumba.com/calendars/seattlegov-city-wide.rss', false)

    events = []

    rss.items.each do |item|
      event = {}

      # Title of Event
      title = item.title.to_s
      event[:title] = title

      # Date of Event
      date = item.category.to_s
      date = Date.parse(date).to_s
      event[:date] = date

      # Info from RSS description
      info = item.description.to_s

      # URL
      url = URI.extract(info, /http(s)?/)
      if url.length != 0
        event[:url] = url[0].to_s
      end

      # Email
      email = URI.extract(info, /mailto/) # is an array
      if email.length != 0
        event[:email] = email[0][7..-1].to_s
      end

      nokogiri_object = Nokogiri::HTML(info)

      # Description
      description = nokogiri_object.xpath("//text()[5]").to_s
      event[:description] = description

      # Location
      address1 = nokogiri_object.xpath("//text()[1]")[0].to_s
      address2 = nokogiri_object.xpath("//text()[2]").to_s
      address3 = nokogiri_object.xpath("//text()[3]").to_s
      location = address1 + ", " + address2 + ", " + address3
      event[:location] = location

      # Topics
      event_types = ["Adults", "All", "Children", "Family", "Pets", "Senior", "Special Needs",
        "Teen", "Festivals/Fairs", "Film", "Community", "Education", "Youth", "Other",
        "Public Safety", "Ethnic/Cultural", "Museum/Gallery", "Special Events",
        "Arts", "Holiday/Seasonal Events", "Tourism", "Business/Trade", "Gardening",
        "Hobbies", "Boards &amp; Commissions", "Nature/Environment", "Volunteer/Work Party",
        "Public Outreach and Engagement", "Public Forum", "Training-Classes/Workshops",
        "City Council Meeting", "Technology", "Transportation", "Neighborhood Meetings",
        "Music", "Animal Shelter", "LGBT", "Dance", "Sports/Recreation", "Theater"]

      topics = ""
      event_types.each do |type|
        if info.include? type
          topics += type + ", "
        end
      end
      topics = topics.chomp(", ")
      event[:topics] = topics

      events << event
    end

    return events
  end
end
