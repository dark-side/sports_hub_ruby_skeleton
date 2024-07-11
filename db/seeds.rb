# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

articles_titles = ["The Art of Scoring Goals", 
                   "Mastering the Perfect Serve", 
                   "Unleashing Your Inner Athlete", 
                   "The Science of Sports Performance", 
                   "Achieving Victory Through Teamwork", 
                   "Exploring the World of Extreme Sports"]

articles_short_descriptions = ["Learn how to score goals like a pro with this comprehensive guide to the art of goal-scoring.",
                                 "Master the perfect serve with this step-by-step guide to serving in tennis.",
                                    "Unleash your inner athlete with this guide to becoming the best athlete you can be.",
                                    "Discover the science behind sports performance and how to improve your game.",
                                    "Achieve victory through teamwork with this guide to working together as a team.",
                                    "Explore the world of extreme sports and learn how to get started with this guide."]

comments = ["This article was very informative and helpful.",
            "I learned a lot from this article and will definitely be using the tips.",
            "Great article! I will be sharing this with my friends.",
            "I loved this article and will be reading more from this author.",
            "This article was very well-written and easy to understand.",
            "I will be recommending this article to everyone I know.",
            "I learned so much from this article and will be using the tips in my own life.",
            "This article was very helpful and informative.",
            "I loved this article and will be reading more from this author.",
            "I will be recommending this article to everyone I know."]


articles_titles.each_with_index do |title, index|
    Article.find_or_create_by!(title: title) do |article|
        article.short_description = articles_short_descriptions[index]
        article.description = "This is the description of the article with title: #{title}"
        article.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', "news_#{index + 1}.jpg")), filename: "#{index + 1}.jpg", content_type: 'image/jpg')
        article.like = Like.create(likes: rand(0..100), dislikes: rand(0..100))
    end
end

articles = Article.all;

articles.each_with_index do |article, index|
    article.comments.create(content: comments[index])
end

5.times do
    article = Article.all.sample;
    article.comments.create(content: comments.sample)
end

4.times do
    article = Article.all.sample;
    article.comments.create(content: comments.sample)
end

6.times do
    article = Article.all.sample;
    article.comments.create(content: comments.sample)
end
    

user = User.new();
user.email = "test@gmail.com";
user.password = "password";
user.password_confirmation = "password";
user.save!;

user2 = User.new();
user2.email = "test2@gmail.com";
user2.password = "password";
user2.password_confirmation = "password";
user2.save!;