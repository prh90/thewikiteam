require 'rails_helper'

describe Section do
  let(:category) { Category.new(title: "Words") }
  let(:article) {Article.new(title: "Hello", summary: "body", footer: "foot")}
  let(:section) {Section.new(title: "Heyo", body: "Yo!")}

  describe "Section" do
    it "has a title" do
      expect(section.title).to eq("Heyo")
    end

    it "has a body" do
      expect(section.body).to eq("Yo!")
    end

    it "should belong to an article" do
      article = Article.new
      article.sections << section
      expect(section.article).to eq article
    end

    it "can have a section revision" do
      revision = Revision.new
      section.revisions << revision
      expect(section.revisions). to include revision
    end
  end
end
