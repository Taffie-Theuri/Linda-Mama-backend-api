# Your corrected seeds code

# ...

# Create 50 users
50.times do
  User.create!(
    username: Faker::Internet.unique.username(specifier: 5..8),
    email: Faker::Internet.unique.email,
    admin: [true, false].sample
  )
end

# Create 100 posts
100.times do
  post = Post.create!(
    title: Faker::Lorem.sentence(word_count: 6, random_words_to_add: 4),
    content: Faker::Lorem.paragraph(sentence_count: 15, supplemental: true, random_sentences_to_add: 10),
    author: User.all.sample
  )

  # Attach an image using Active Storage
  image_url = Faker::LoremFlickr.image(size: "300x300", search_terms: ['nature'])
  post.image.attach(io: open(image_url), filename: "image.jpg")
end

# Create 200 comments
200.times do
  Comment.create!(
    content: Faker::Lorem.paragraph(sentence_count: 4, supplemental: true, random_sentences_to_add: 2),
    user_id: User.pluck(:id).sample,
    post_id: Post.pluck(:id).sample
  )
end
