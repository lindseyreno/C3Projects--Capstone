FactoryGirl.define do  factory :user do
    username "MyText"
email "MyText"
password_digest "MyText"
  end

  factory :event do
    title "Climb for Clean Air Info Session"
    date "2015-10-24"
    location "Seattle Bouldering Project, 900 Poplar Pl S, Seattle, WA 98144"
    url "http://action.lung.org/site/TR?fr_id=12350&amp;pg=entry"
    email "Elepine@lungmtpacific.org"
    description "Climb For Clean Air is exclusive mountaineering training."
  end

  factory :category do
    name "Sports and Recreation"
  end
end
