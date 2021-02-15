gender = [1.2]
100.times do |n|
   User.create!(first_name:Faker::Name.first_name,
               last_name:Faker::Name.last_name,
               email:Faker::Internet.email,
               birthday:Faker::Date.between(from: '1900-01-01',to:'2010-12-31'),
               gender: n < 50 ? 1 : 2
  )
end