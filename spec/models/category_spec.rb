require 'rails_helper'

describe Category do
  let(:category) { Category.new(title: "Words") }
  let(:article) {Article.new(title: "Hello", summary: "body")}

  describe "Category" do
    it "has a title" do
      expect(category.title).to eq("Words")
    end

    it "has associated articles" do
      category.articles << article
      expect(category.articles).to include(article)
    end
  end
end
