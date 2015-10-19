# require 'treat'
# include Treat::Core::DSL

class AssignCategories
  def self.assign_categories(event)
    if event[:topics] == ""
      category = Category.find_by(name: "Miscellaneous")
      event.categories << category
    else
      # Sports and Recreation
      if event[:topics].include? "Sports/Recreation" || "Hobbies"
        category = Category.find_by(name: "Sports and Recreation")
        event.categories << category
      end

      # Learning Opportunities
      if event[:topics].include? "Training-Classes/Workshops" || "Education"
        category = Category.find_by(name: "Learning Opportunities")
        event.categories << category
      end

      # Fun for the Whole Family
      if event[:topics].include? "All" || "Family" || ("Adults" && "Children" && "Senior" && "Special Needs" && "Teen")
        category = Category.find_by(name: "Fun for the Whole Family")
        event.categories << category
      end

      # Theater
      if event[:topics].include? "Theater"
        category = Category.find_by(name: "Theater")
        event.categories << category
      end

      # Film
      if event[:topics].include? "Film"
        category = Category.find_by(name: "Film")
        event.categories << category
      end

      # Arts
      if event[:topics].include? "Film" || "Theater" || "Museum/Gallery" || "Dance" || "Arts" || "Music"
        category = Category.find_by(name: "Arts")
        event.categories << category
      end

      # Seasonal
      if event[:topics].include? "Holiday/Seasonal Events"
        category = Category.find_by(name: "Seasonal")
        event.categories << category
      end

      # Volunteer
      if event[:topics].include? "Volunteer/Work Party"
        category = Category.find_by(name: "Volunteer")
        event.categories << category
      end

      # Museums and Galleries
      if event[:topics].include? "Museum/Gallery"
        category = Category.find_by(name: "Museums and Galleries")
        event.categories << category
      end

      # Dance
      if event[:topics].include? "Dance"
        category = Category.find_by(name: "Dance")
        event.categories << category
      end

      # For the Kids
      if event[:topics].include? "Children" || "Youth"
        category = Category.find_by(name: "For the Kids")
        event.categories << category
      end

      # Festivals and Fairs
      if event[:topics].include? "Festivals/Fairs"
        category = Category.find_by(name: "Festivals and Fairs")
        event.categories << category
      end

      # Public Safety
      if event[:topics].include? "Public Safety"
        category = Category.find_by(name: "Public Safety")
        event.categories << category
      end

      # Nature and Environment
      if event[:topics].include? "Nature/Environment"
        category = Category.find_by(name: "Nature and Environment")
        event.categories << category
      end

      # Technology
      if event[:topics].include? "Technology"
        category = Category.find_by(name: "Technology")
        event.categories << category
      end

      # Cultural
      if event[:topics].include? "Ethnic/Cultural"
        category = Category.find_by(name: "Cultural")
        event.categories << category
      end

      # Miscellaneous
      if event[:topics].include? "Special Events" || "Other"
        category = Category.find_by(name: "Miscellaneous")
        event.categories << category
      end

      # Local Government
      if event[:topics].include? "City Council Meetings" || "Public Forum"|| "Neighborhood Meetings" || "Boards &amp; Commissions"
        category = Category.find_by(name: "Local Government")
        event.categories << category
      end

      # City Council Meetings
      if event[:topics].include? "City Council Meetings"
        category = Category.find_by(name: "City Council Meetings")
        event.categories << category
      end

      # Pets
      if event[:topics].include? "Pets" || "Animal Shelter"
        category = Category.find_by(name: "Pets")
        event.categories << category
      end

      # Music
      if event[:topics].include? "Music"
        category = Category.find_by(name: "Music")
        event.categories << category
      end

      # Boards and Commissions
      if event[:topics].include? "Boards &amp; Commissions"
        category = Category.find_by(name: "Boards and Commissions")
        event.categories << category
      end

      # Community
      if event[:topics].include? "Community" || "Public Safety" || "Public Outreach and Engagement"
        category = Category.find_by(name: "Community")
        event.categories << category
      end

      # Transportation
      if event[:topics].include? "Transportation"
        category = Category.find_by(name: "Transportation")
        event.categories << category
      end

      # Gardening
      if event[:topics].include? "Gardening"
        category = Category.find_by(name: "Gardening")
        event.categories << category
      end

      # Hobbies
      if event[:topics].include? "Hobbies" || "Gardening"
        category = Category.find_by(name: "Hobbies")
        event.categories << category
      end

      # Business and Trade
      if event[:topics].include? "Business/Trade"
        category = Category.find_by(name: "Business and Trade")
        event.categories << category
      end

      # Adults
      if event[:topics].include? "Adults"
        category = Category.find_by(name: "Adults")
        event.categories << category
      end

      # Seniors
      if event[:topics].include? "Senior"
        category = Category.find_by(name: "Seniors")
        event.categories << category
      end

      # LGBT
      if event[:topics].include? "LGBT"
        category = Category.find_by(name: "LGBT")
        event.categories << category
      end

      # Miscellaneous
      if event[:topics].include? "Other" || "Special Events"
        category = Category.find_by(name: "Miscellaneous")
        event.categories << category
      end
    end
  end
end

# Categories -- Topics Associated
# "Sports and Recreation" -- "Sports/Recreation" "Hobbies"
# "Learning Opportunities" -- "Training-Classes/Workshops" "Education"
# "Fun for the Whole Family" -- "Adults" "All" "Children" "Family" "Pets" "Senior" "Special Needs" "Teen"
# "Theater" -- "Theater"
# "Film" -- "Film"
# "Arts" -- "Film" "Theater" "Museum/Gallery" "Dance" "Arts" "Music"
# "Seasonal" -- "Holiday/Seasonal Events"
# "Volunteer" -- "Volunteer/Work Party"
# "Museums and Galleries" -- "Museum/Gallery"
# "Dance" -- "Dance"
# "For the Kids" -- "Children" "Youth"
# "Festivals and Fairs" -- "Festivals/Fairs"
# "Public Safety" -- "Public Safety"
# "Nature and Environment" -- "Nature/Environment"
# "Technology" -- "Technology"
# "Cultural" -- "Ethnic/Cultural"
# "Miscellaneous" -- "Special Events" "Other"
# "Local Government" -- "City Council Meetings" "Boards &amp; Commissions" "Public Forum" "Neighborhood Meetings"
# "City Council Meetings" "City Council Meetings"
# "Pets" -- "Pets" "Animal Shelter"
# "Music" -- "Music"
# "Boards and Commissions" -- "Boards &amp; Commissions"
# "Community" -- "Community" "Public Outreach and Engagement" "Public Safety"
# "Transportation" -- "Transportation"
# "Gardening" -- "Gardening"
# "Hobbies" -- "Hobbies" "Gardening"
# "Business and Trade" -- "Business/Trade"
# "Adults" -- "Adults"
# "Seniors" -- "Senior"
# "LGBT" -- "LGBT"
# "Miscellaneous" -- "Special Events" "Other"

# "Free!"

# Topics
# event_types = ["Adults", "All", "Children", "Family", "Pets", "Senior", "Special Needs",
#   "Teen", "Festivals/Fairs", "Film", "Community", "Education", "Youth", "Community",
#   "Other", "Public Safety", "Ethnic/Cultural", "Museum/Gallery", "Special Events",
#   "Arts", "Holiday/Seasonal Events", "Tourism", "Business/Trade", "Gardening",
#   "Hobbies", "Boards &amp; Commissions", "Nature/Environment", "Volunteer/Work Party",
#   "Public Outreach and Engagement", "Public Forum", "Training-Classes/Workshops",
#   "City Council Meeting", "Technology", "Transportation", "Neighborhood Meetings",
#   "Music", "Animal Shelter", "LGBT", "Dance", "Sports/Recreation", "Theater"]
