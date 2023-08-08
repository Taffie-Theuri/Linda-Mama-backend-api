# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Generate 10 fake users
# db/seeds.rb

# Create 20 fake posts on pregnancy health
# db/seeds.rb
require 'faker'

# Helper method to get random user ID
def random_user_id
  User.pluck(:id).sample
end

# Helper method to get random post ID
def random_post_id
  Post.pluck(:id).sample
end

# Create 50 users
50.times do
  User.create!(
    username: Faker::Internet.unique.username(specifier: 5..8),
    email: Faker::Internet.unique.email,
    password: 'password',
    admin: [true, false].sample
  )
end

# Create 100 posts
100.times do
  Post.create!(
    title: Faker::Lorem.sentence(word_count: 6, random_words_to_add: 4),
    content: Faker::Lorem.paragraph(sentence_count: 15, supplemental: true, random_sentences_to_add: 10),
    author_id: random_user_id
  )
end

# Create 200 comments
200.times do
  Comment.create!(
    content: Faker::Lorem.paragraph(sentence_count: 4, supplemental: true, random_sentences_to_add: 2),
    user_id: random_user_id,
    post_id: random_post_id
  )
end


