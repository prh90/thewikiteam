Category.delete_all
Article.delete_all
Section.delete_all
Revision.delete_all
User.delete_all

categories = ["Phase 1", "Phase 2", "Phase 3", "Phase 4", "Cohorts", "Staff", "Ping Pong"]
articles = ["Article 1", "Article 2", "Article 3", "Article 4"]

user1 = User.create!(username: "bob", email: "bob@www.com", password: "password")
user2 = User.create!(username: "mary", email: "mary@www.com", password: "password")
user3 = User.create!(username: "joe", email: "joe@www.com", password: "password")

categories.each do |category|
  Category.create!(title: category)
end

articles.each do |article|
  Article.create!(title: article, summary: "DBC rocks!", footer: "It's alright...", creator_id: rand(1..3))
end
#
#
# Category.all.each do |category|
#   category.articles.create!(article_id: rand(1..4), category_id: category.id)
# end
