require 'rails_helper'

RSpec.describe User, type: :model do
  describe "model validations" do
    describe "username" do
      it "requires a username" do
        user = build :user, username: nil

        user.valid?
        expect(user.errors.keys).to include(:username)
      end

      it "requires username to be unique" do
        create :user
        user = build :user, email: "sam@sam.com"

        user.valid?
        expect(user.errors.messages).to include(:username => ["has already been taken"])
      end
    end

    describe "email" do
      it "requires an email" do
        user = build :user, email: nil

        user.valid?
        expect(user.errors.keys).to include(:email)
      end

      it "requires email to be unique" do
        create :user
        user = build :user, username: "sam"

        user.valid?
        expect(user.errors.messages).to include(:email => ["has already been taken"])
      end

      it "requires email to fit an email pattern" do
        user = build :user, email: "@."

        user.valid?
        expect(user.errors.messages).to include(:email => ["is invalid"])
      end
    end

    it "requires a password" do
      user = build :user, password: nil

      user.valid?
      expect(user.errors.keys).to include(:password)
    end
  end

  describe "methods" do
    describe "#authenticated?" do
      it "returns false for a user with nil digest" do
        user = create :user

        expect(user.authenticated?(:activation, "")).to eq false
      end

      it "returns true if the activation_token matches the activation_digest" do
        user = create :user

        expect(user.authenticated?(:activation, user.activation_token)).to eq true
      end
    end

    describe "#self.new_token" do
      it "returns a token with a length of 22 characters" do
        expect(User.new_token.length).to eq 22
      end

      it "returns a different token every time it is called" do
        token = User.new_token
        token2 = User.new_token

        expect(token).to_not eq token2
      end
    end
  end
end
