require 'faker'
require 'open-uri'
require 'cloudinary'

# Create Users
users = []
30.times do |i|
  username = Faker::Internet.username(specifier: "user#{i + 1}")
  users << User.create!(username: username)
end

# Create Posts
posts = []
image_urls = [
  "https://res.cloudinary.com/dtnohzfmg/image/upload/v1691619555/211207-Illustrations-Black-Fetus-in-Utero-2000-4cfb977c8f634364a1b078962c7446ce_kn6qtq.webp",
  "https://res.cloudinary.com/dtnohzfmg/image/upload/v1691619475/pregnant-woman-on-couch-786x524.png_bponlo.webp"
  # Add more image URLs here for each post
]

20.times do |i|
  post = Post.create!(
    title: Faker::Lorem.sentence,
    content: Array.new(4) { Faker::Lorem.paragraph_by_chars(number: 40) }.join("\n\n")
  )
  
  # Upload image to Cloudinary
  image_url = image_urls[i % image_urls.length] # Select image URL from the list
  cloudinary_response = Cloudinary::Uploader.upload(image_url)
  
  # Attach the Cloudinary image to the post
  post.image.attach(io: URI.open(cloudinary_response['secure_url']), filename: 'image.png')
  
  posts << post
end

# Create Comments
posts.each do |post|
  3.times do
    user = users.sample
    post.comments.create!(
      user: user,
      content: Faker::Lorem.sentence(word_count: rand(5..15)) # Varying length of comments
    )
  end
end
