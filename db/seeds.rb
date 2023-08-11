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
    "https://res.cloudinary.com/dtnohzfmg/image/upload/v1691733198/Benefits-Prenatal-Yoga_mq87wl.jpg",
    "https://res.cloudinary.com/dtnohzfmg/image/upload/v1691733146/images_mhijlv.jpg",
    "https://res.cloudinary.com/dtnohzfmg/image/upload/v1691733103/images_klp11s.jpg",
    "https://res.cloudinary.com/dtnohzfmg/image/upload/v1691733075/Solgar-Prenatal-60-Tableta_qbhk1v.jpg",
    "https://res.cloudinary.com/dtnohzfmg/image/upload/v1691732795/pregnantWmnDocOffice-1212384224-770x533-1-650x428_mdpume.jpg",
    "https://res.cloudinary.com/dtnohzfmg/image/upload/v1691732909/Couvade_syndrome_720x432px_sp5vqe.jpg",
    "https://res.cloudinary.com/dtnohzfmg/image/upload/v1691732883/IconTrimester-3_ztq5yw.webp",
    "https://res.cloudinary.com/dtnohzfmg/image/upload/v1691732766/young-pregnant-woman-taking-medicine-debica-poland-royalty-free-image-1603751766.jpg_gknl5s.jpg",
    "https://res.cloudinary.com/dtnohzfmg/image/upload/v1691732733/Pregnancy_share_opedee.jpg",
    "https://res.cloudinary.com/dtnohzfmg/image/upload/v1691732644/pregnant_mom_squatting_and_exercising_with_daughter-1200x628-facebook-1200x628_bnryq5.jpg",
    "https://res.cloudinary.com/dtnohzfmg/image/upload/v1691732608/pregnancy-exercises-5-1586187787.jpg_emvovn.jpg",
    "https://res.cloudinary.com/dtnohzfmg/image/upload/v1691732572/7205-Pregnancy_20nutrition_2002_1006x755_ugrbbm.jpg",
    "https://res.cloudinary.com/dtnohzfmg/image/upload/v1691732480/cv9mpsjhqmnflu88g8ba.jpg",
    "https://res.cloudinary.com/dtnohzfmg/image/upload/v1691732515/Pregnancy-Checkups-Why-Are-They-Important_bzpq4p.jpg",
    "https://res.cloudinary.com/dtnohzfmg/image/upload/v1691732416/pregnancy-exercises-1676366655_oowxec.jpg",
    "https://res.cloudinary.com/dtnohzfmg/image/upload/v1691732243/Lupus_Pregnancy-medium_cdqpot.jpg",
    "https://res.cloudinary.com/dtnohzfmg/image/upload/v1691731981/shutterstock_1779383069_vmzsa5.jpg",
    "https://res.cloudinary.com/dtnohzfmg/image/upload/v1691733399/211207-Illustrations-Black-Fetus-in-Utero-2000-4cfb977c8f634364a1b078962c7446ce_kn6qtq_rmgkfz.webp"


  # Add more image URLs here for each post
]

20.times do |i|
  post = Post.create!(
    title: Faker::Lorem.sentence,
    content: Array.new(4) { Faker::Lorem.paragraph_by_chars(number: 90) }.join("\n\n")
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
