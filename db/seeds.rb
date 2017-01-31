Category.delete_all
Article.delete_all
Section.delete_all
Revision.delete_all
User.delete_all

categories = ["Phase 1", "Phase 2", "Phase 3", "Phase 4", "Cohorts", "Staff", "Ping Pong"]
articles = ["Article 1", "Article 2", "Article 3", "Article 4"]

users = []
users << user1 = User.create!(username: "bob", email: "bob@www.com", password: "password")
users << user2 = User.create!(username: "mary", email: "mary@www.com", password: "password")
users << user3 = User.create!(username: "joe", email: "joe@www.com", password: "password")

categories.each do |category|
  Category.create!(title: category)
end

created_articles = []
articles.each do |article|
  created_articles << Article.create!(title: article, summary: Faker::Lorem.paragraph, footer: "It's alright...", creator_id: rand(1..3))
end

Category.all.each do |category|
  category.articles << created_articles.sample
end

Article.all.each do |article|
	5.times do
		article.sections.create!(title: Faker::Lorem.word, body: Faker::Lorem.paragraph)
	end
end
