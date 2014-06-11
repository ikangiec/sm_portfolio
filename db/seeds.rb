# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@editor = User.create(name:  "PortfolioAdmin",
                      email: "editor@example.com",
                      password: "password",
                      password_confirmation: "password",
                      role: "editor" )
10.times do
  @post = Post.create(title: Faker::Company.catch_phrase,
              body: Faker::Lorem.paragraphs.join("\n"),
              published: rand(2) == 1,
              author_id: @editor.id)
  puts "Created sample post #{@post.title}, published: #{@post.published}"
end

10.times do
  @project = Project.create(title: Faker::Commerce.product_name,
              description: Faker::Lorem.paragraphs.join("\n"))
  puts "Created sample project #{@project.title}"
end

# @comment = Comment.create(author: "Commenter",
#                          author_url: "commenter.com",
#                          author_email: "commenter@commenter.com",
#                          referrer: "http://localhost:3000/posts",
#                          content: "commenter's comment",
#                          approved: true,
#                          commentable_id: 1,
#                          commentable_type: "Post")

5.times do
  @comment = Comment.create(author: Faker::Name.name,
                           author_url: Faker::Internet.url,
                           author_email: Faker::Internet.email,
                           referrer: "http://localhost:3000/posts",
                           content: Faker::Lorem.sentence,
                           approved: rand(2) == 1,
                           commentable_id: rand(1..2),
                           commentable_type: "Post")
  puts "Created sample comment for #{@comment.author}, approved: #{@comment.approved}"
end

puts "Done: Editor Seeded.\n #{@editor.to_yaml}"

