require 'faker'



puts 'Seeding doctors..'
Doctor.create(title: 'MD', name: 'Patch Adams', bio: Faker::Movies::Hobbit.quote, email: 'patchadams@flatironmed.edu', password_digest: '123', doc: true)
15.times do
  Doctor.create(
    title: 'MD',
    name: Faker::Movies::LordOfTheRings.character,
    bio: Faker::Movies::Hobbit.quote,
    # department_id: rand(1..Department.all.size),
    email: "#{Faker::Internet.username}@gmail.com",
    password_digest: Faker::Internet.password,
    doc: true
  )
end
15.times do
  Doctor.create(
    title: 'DO',
    name:Faker::Movies::LordOfTheRings.character,
    bio: Faker::Movies::Hobbit.quote,
    # department_id: rand(1..Department.all.size),
    email: "#{Faker::Internet.username}@flatironmed.edu",
    password_digest: Faker::Internet.password,
    doc: true
  )
end

puts 'Seeding patients..'
Patient.create(name: "Ben Anthony", age: rand(18..65), birthdate: Faker::Date.birthday(min_age: 18, max_age: 65), email: "ba1@gmail.com", password: "123", doc: false)
20.times do
  Patient.create(
    name: Faker::Movies::LordOfTheRings.character,
    age: rand(18..65),
    birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),
    email: Faker::Internet.free_email,
    password: Faker::Internet.password,
    doc: false
  )
end

# .strftime('%a %b %d %Y %H:%M:%S GMT-0400 (Eastern Daylight Time)')
puts 'Seeding appointments..'
50.times do
  Appointment.create(
    doctor_id: 1,
    patient_id: rand(1..Patient.all.size),
    title: Faker::Movie.title,
    location: Faker::Movies::LordOfTheRings.location,
    startDate: DateTime.new(2022,6,rand(1..30),rand(1..19),rand(1.60)),
    endDate: DateTime.new(2022,6,rand(1..30),rand(6..19),rand(1.60)),
    notes: Faker::Fantasy::Tolkien.poem
  )
end


\
puts "🌱 Seeding done..."
