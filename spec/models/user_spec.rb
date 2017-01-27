require 'rails_helper'

describe User do
  let(:user) { User.new(username: "wordhunter", email: "hunter@words.com", password: "wordswordswords") }
  let(:article) {Article.new(title: "Hello", summary: "body")}

  describe "User" do
    it "has a username" do
      expect(user.username).to eq("wordhunter")
    end

    it "has an email" do
      expect(user.email).to eq("hunter@words.com")
    end

    it "has an encrypted password" do
      expect(user.password).not_to be nil
      expect(user.password).not_to be("wordswordswords")
    end
  end
end
