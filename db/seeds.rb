require 'assign_categories'

categories = [
  { name: 'Sports and Recreation' },
  { name: 'Learning Opportunities' },
  { name: 'Fun for the Whole Family' },
  { name: 'Theater' },
  { name: 'Film' },
  { name: 'Arts' },
  { name: 'Seasonal' },
  { name: 'Volunteer' },
  { name: 'Museums and Galleries' },
  { name: 'Dance' },
  { name: 'For the Kids' },
  { name: 'Festivals and Fairs' },
  { name: 'Public Safety' },
  { name: 'Nature and Environment' },
  { name: 'Technology' },
  { name: 'Culture' },
  { name: 'Local Government' },
  { name: 'City Council Meetings' },
  { name: 'Pets' },
  { name: 'Music' },
  { name: 'Boards and Commissions' },
  { name: 'Community' },
  { name: 'Transportation' },
  { name: 'Gardening' },
  { name: 'Hobbies' },
  { name: 'Business and Trade' },
  { name: 'Seniors' },
  { name: 'LGBT' },
  { name: 'Miscellaneous' }
]

categories.each do |category|
  Category.create(category)
end

events = [
  { :title=>'What We Talk About When We Talk About Love',
    :date=>'2015-10-18',
    :url=>'http://book-it.org/what-we-talk-about-when-we-talk-about-love-3/',
    :email=>'boxoffice@book-it.org',
    :description=>'Four people sit around a table, drink gin, and discuss what it means to love someone. What they reveal will have you unable to look away. Raymond Carver’s What We Talk About When We Talk About Love, featured in 2014’s Oscar-winning Birdman, is paired with “Cathedral,” “Intimacy,” and “The Student’s Wife.” Book-It wowed mainstage audiences with this collection during 1998-99. Carver, who lived in Port Angeles, depicts ordinary people in “dirty realism” as they contend with life the best way they can. ',
    :location=>'The Center Theatre at the Armory, 305 Harrison St, Seattle, WA 98109 ',
    :topics=>'Adults, Senior, Teen, Theater' },
  { :title=>'Design Review- 1225 E Jefferson St',
    :date=>'2015-10-28',
    :url=>'http://www.seattle.gov/dpd/aboutus/news/events/DesignReview/Detail/default.aspx?id=5619',
    :description=>'Design Review Early Design Guidance application for a 4 story, 15 room hotel with 1,400 sq.ft. of commercial space for bakery and cafe. Existing structures to be demolished.',
    :location=>'Seattle University, 824 12th Ave, Admissions &amp; Alumni Community Building ',
    :topics=>'Adults, All, Community, Boards &amp; Commissions' },
  { :title=>'21 Acres: Seasonal Cheese Tasting',
    :date=>'2015-10-28',
    :url=>'https://21acrescheesetasting10282015.eventbrite.com',
    :email=>'deb@21acres.org',
    :description=>'Bring your taste buds and join our resident Cheese Monger, Marie Calderon, as she leads you through a mouth tingling experience tasting a variety of local, sustainably produced cheeses of varying styles. Marie will show the milk changes for fall. She will also get in the detail of explaining molds, rennet, flavor profiles, and how to choose the perfect combination of cheeses to make a delicious Fall cheese plate. The discussion and sampling will also include pairing ideas for what to serve with the cheese plate.',
    :location=>'21 Acres Center for Local Food and Sustainable Living, 13701 NE 171st St, Woodinville, WA 98072 ',
    :topics=>'All, Community, Education, Community, Training-Classes/Workshops' },
  { :title=>'Firefighter Story Time',
    :date=>'2015-10-29',
    :email=>'danacatts@seattle.gov',
    :description=>': Firefighters read fire safety stories to preschoolers, dress in full bunking gear and help children explore a fire engine or ladder truck. ',
    :location=>'Douglass-Truth Branch Library, 2300 E. Yesler, Seattle, WA ',
    :topics=>'Children, Family, Community, Education, Community, Public Safety, Public Outreach and Engagement' },
  { :title=>'Feet First Presents: The Lake View Cemetery Haunted History Hike',
    :date=>'2015-10-29',
    :url=>'https://www.strangertickets.com/events/28581005/haunted-history-hike',
    :email=>'jules@feetfirst.org',
    :description=>"On Thursdays and Saturdays through the month of October, let Feet First Neighborhood Walk Ambassadors take you on a stroll through the spookier side of Seattle. These 75-minute walks in historic Lake View Cemetery highlight the history and legends of Seattle's pioneers, entrepreneurs and eccentrics.",
    :location=>'Lake View Cemetery, 1554 15th Ave E, Seattle, WA 98112 ',
    :topics=>'Adults, Family, Community, Other, Special Events, Arts, Holiday/Seasonal Events, Tourism' },
  { :title=>'Documentary film JUREK. Director Paweł Wysoczański at the screening',
    :date=>'2015-10-28',
    :url=>'http://www.polishstudiesuw.org/',
    :email=>'ewaporaj@q.com',
    :description=>'JUREK is a documentary about Jerzy Kukuczka (1948-1986), a Polish mountaineer, considered to be one of the best high-altitude climbers in history. He ascended fourteen of the world’s tallest mountains in less than eight years, a world record he held for 27 years. Kukuczka established several new mountain routes, ascending often in winter, and mostly without oxygen.',
    :location=>'University of Washington, 4060 George Washington Ln, Seattle, WA 98195 ',
    :topics=>'Adults, All, Children, Family, Pets, Senior, Special Needs, Teen, Film, Education' },
  { :title=>'Seattle Home Show 2',
    :date=>'2015-10-23',
    :url=>'http://www.seattlehomeshow.com/',
    :description=>'The 17th annual housing extravaganza will have hundreds of displays of home and garden products. Get festive with “Holidays for Your Home” feature. Daily “Meet the Experts” seminars brought to you by Sleep Number®. Cooking demos on the Ferguson Stage by well-known local chefs. Outdoor Living &amp; Wine Tasting area. Everything for your home, from the newest in building products and materials to living green; landscape displays; arts &amp; crafts; home decorating; and more. ',
    :location=>'CenturyLink Field Event Center, 1000 Occidental Ave S, Seattle, WA 98134 ',
    :topics=>'Adults, All, Senior, Festivals/Fairs, Community, Special Events, Gardening' },
  { :title=>'CJQ with friends',
    :date=>'2015-10-22',
    :description=>'CJQ is a high energy showband with a fresh approach to jazz and contemporary music. It features four musicians (piano, sax, drums &amp; bass) who have toured and played with countless well-known, national artists. Playing everything from Brubeck to the Beatles. They are often joined by guest musicians and vocalists. ',
    :location=>'Shuga Jazz Bistro, 317 Main Ave S, Renton, WA 98057 ',
    :topics=>'Adults, Music' },
  { :title=>"The Future- Seattle's only Back to the future day celebration",
    :date=>'2015-10-22',
    :url=>'http://the-future.brownpapertickets.com/',
    :email=>'luke.s.walker@thefuture4u.com',
    :description=>"You've been waiting for this date since 1989 and it's finally here...THE FUTURE! Bust out your hoverboard, hop in your DeLorean and come on down to the LIVING COMPUTER MUSEUM to celebrate ALL THINGS SCI-FI! We'll have 3 nights of Art, Music, Performance, Dance, experimental food and beverages and of course sci fi costumes for you to enjoy.",
    :location=>'The Living Computer Museum, 2245 1st Ave S, Seattle, WA 98134 ',
    :topics=>'Adults, Festivals/Fairs, Film, Education, Museum/Gallery, Arts, Holiday/Seasonal Events, Music, Dance' },
  { :title=>'Seattle Seahawks vs. Carolina Panthers',
    :date=>'2015-10-18',
    :url=>'http://www.ticketstub.com/tickets/seattle-seahawks/2546042/',
    :email=>'ticketstub.info@gmail.com',
    :description=>'Come see the Seattle Seahawks take on the Carolina Panthers at CenturyLink Field right here in Seattle ',
    :location=>'CenturyLink Field, Occidental Ave S, Seattle, WA 98104 ',
    :topics=>'All, Sports/Recreation' }
]

events.each do |event|
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

schedules = [
  { :name => 'Every Day',
    :description => 'Contains events for the next day, sent every day.'
  },
  { :name => 'Just the Weekend',
    :description => 'Contains events for the upcoming Friday, Saturday and Sunday, sent every Wednesday.'
  },
  { :name => 'This Week',
    :description => 'Contains events for the whole week, sent every Sunday.'
  },
  # { :name => 'Every Two Weeks',
  #   :description => 'Contains events for the next two weeks, sent on Sunday every other week.'
  # },
  { :name => 'This Month',
    :description => 'Contains events for the month, sent on the first day of the month.'
  },
  { :name => 'None',
    :description => 'The newsletter is not sent.'
  }
]

schedules.each do |schedule|
  Schedule.create(schedule)
end

10.times do |n|
  username  = "user#{n+1}"
  email = "user-#{n+1}@example.com"
  password = "password#{n+1}"
  schedule = Schedule.all.sample.id
  User.create(username:  username,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now,
               schedule_id: schedule)
end

User.all.each do |user|
  user.categories << Category.all.sample(rand(0..3))
end
