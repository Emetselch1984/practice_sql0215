# frozen_string_literal: true

gender = [1.2]
500.times do |n|
  user = User.create!(first_name: Faker::Name.first_name,
                      last_name: Faker::Name.last_name,
                      email: Faker::Internet.email,
                      birthday: Faker::Date.between(from: '1900-01-01', to: '2010-12-31'),
                      gender: n < 50 ? 1 : 2)
end

1000.times do
  Order.create(
    order_time: Faker::Date.between(from: '2017-01-01', to: '2017-12-31'),
    amount: format('%d', rand(3000..50_000)),
    user: User.offset(rand(User.count)).first
  )
end

1000.times do |n|
  Product.create(
    name: "商品#{n}",
    price: format('%d00', rand(10..90))
  )
end

12_000.times do
  AccessLog.create(
    user: User.offset(rand(User.count)).first,
    request_month: format('2017-%d-01', rand(1..12))
  )
end
