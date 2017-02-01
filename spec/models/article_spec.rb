require 'rails_helper'

describe Article do
  let(:category) { Category.new(title: "Words") }
  let(:article) {Article.new(title: "Hello", summary: "body", footer: "foot")}

  describe "Article" do
    it "has a title" do
      expect(article.title).to eq("Hello")
    end

    it "has a summary" do
      expect(article.summary).to eq("body")
    end

    it "has a footer" do
      expect(article.footer).to eq("foot")
    end

    it "should belong to a user" do
      user = User.new
      user.created_articles << article
      expect(user.created_articles).to include article
    end

    it "can have a section" do
      section = Section.new
      article.sections << section
      expect(article.sections).to include section
    end

    it "can have a section revision" do
      section = Section.new
      article.sections << section
      revision = Revision.new
      section.revisions << revision
      expect(article.revisions). to include revision
    end
  end
end
