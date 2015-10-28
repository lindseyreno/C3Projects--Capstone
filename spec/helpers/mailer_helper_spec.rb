require 'rails_helper'

RSpec.describe MailerHelper, type: :helper do
  describe "pretty date" do
    it "puts a date in the format of 'Day of the Week, Month Date'" do
      date = 'Wed, 28 Oct 2015'
      expect(helper.pretty_date(date)).to eq 'Wednesday, Oct 28'
    end
  end
end
