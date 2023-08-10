require 'faker'
require 'open-uri'
require 'cloudinary'


# Create Users
users = []
3.times do |i|
  users << User.create!(
    username: Faker::Internet.username(specifier: "user#{i + 1}")
  )
end

# Create Posts
posts = []
20.times do
  post = Post.create!(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph
  )
  
  # Attach image using Active Storage
  image_url = "https://res.cloudinary.com/dtnohzfmg/image/upload/v1691619555/211207-Illustrations-Black-Fetus-in-Utero-2000-4cfb977c8f634364a1b078962c7446ce_kn6qtq.webp"
  post.image.attach(io: URI.open(image_url), filename: 'image.png')
  
  posts << post
end

# Create Comments
posts.each do |post|
  2.times do
    post.comments.create!(
      content: Faker::Lorem.sentence,
      user: users.sample
    )
  end
end
