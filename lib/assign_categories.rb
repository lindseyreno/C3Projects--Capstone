# require 'treat'
# include Treat::Core::DSL

class AssignCategories
  def self.assign_categories(event)
    if event[:topics] == ""
      category = Category.find_by(name: "Miscellaneous")
      event.categories << category
    else
      topic_category = {
        'Adult'                          => 'Adults',
        'All'                            => 'Fun for the Whole Family',
        'Animal Shelter'                 => 'Pets',
        'Arts'                           => 'Arts',
        'Boards &amp; Commissions'       => 'Boards and Commissions',
        'Business/Trade'                 => 'Business and Trade',
        'Children'                       => 'For the Kids',
        'City Council Meetings'          => 'City Council Meetings',
        'Community'                      => 'Community',
        'Dance'                          => 'Arts',
        'Education'                      => 'Learning Opportunities',
        'Ethnic/Cultural'                => 'Cultural',
        'Family'                         => 'Fun for the Whole Family',
        'Festivals/Fairs'                => 'Festivals and Fairs',
        'Film'                           => 'Arts',
        'Gardening'                      => 'Gardening',
        'Hobbies'                        => 'Hobbies',
        'Holiday/Seasonal Events'        => 'Seasonal',
        'LGBT'                           => 'LGBT',
        'Museum/Gallery'                 => 'Arts',
        'Music'                          => 'Arts',
        'Nature/Environment'             => 'Nature and Environment',
        'Neighborhood Meetings'          => 'Local Government',
        'Other'                          => 'Miscellaneous',
        'Pets'                           => 'Pets',
        'Public Forum'                   => 'Local Government',
        'Public Outreach and Engagement' => 'Community',
        'Public Safety'                  => 'Community',
        'Senior'                         => 'Seniors',
        'Special Events'                 => 'Miscellaneous',
        'Sports/Recreation'              => 'Sports and Recreation',
        'Theater'                        => 'Arts',
        'Training-Classes/Workshops'     => 'Learning Opportunities',
        'Transportation'                 => 'Transportation',
        'Volunteer/Work Party'           => 'Volunteer',
        'Youth'                          => 'For the Kids'
      }

      topic_category2 = {
        'Boards &amp; Commissions'       => 'Local Government',
        'City Council Meetings'          => 'Local Government',
        'Dance'                          => 'Dance',
        'Film'                           => 'Film',
        'Gardening'                      => 'Hobbies',
        'Hobbies'                        => 'Sports and Recreation',
        'Museum/Gallery'                 => 'Museums and Galleries',
        'Music'                          => 'Music',
        'Public Safety'                  => 'Public Safety',
        'Theater'                        => 'Theater'
      }

      topic_category.each do |key, value|
        if event[:topics].include? key
          category = Category.find_by(name: value)
          event.categories << category
        end
      end

      topic_category2.each do |key, value|
        if event[:topics].include? key
          category = Category.find_by(name: value)
          event.categories << category
        end
      end

      # Fun for the Whole Family
      if event[:topics].include? ('Adults' && 'Children' && 'Senior' && 'Special Needs' && 'Teen')
        category = Category.find_by(name: 'Fun for the Whole Family')
        event.categories << category
      end
    end
  end
end

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
