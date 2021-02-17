# frozen_string_literal: true

gender = [1.2]
500.times do |n|
  user = User.create!(first_name: Faker::Name.first_name,
                      last_name: Faker::Name.last_name,
                      email: Faker::Internet.email,
                      birthday: Faker::Date.between(from: '1900-01-01', to: '2010-12-31'),
                      gender: n < 50 ? 1 : 2,
                      prefecture_id: format('%d', rand(1..47)))
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
PREFECTURE_NAMES = %w(
    北海道
    青森県 岩手県 宮城県 秋田県 山形県 福島県
    茨城県 栃木県 群馬県 埼玉県 千葉県 東京都 神奈川県
    新潟県 富山県 石川県 福井県 山梨県 長野県 岐阜県 静岡県 愛知県
    三重県 滋賀県 京都府 大阪府 兵庫県 奈良県 和歌山県
    鳥取県 島根県 岡山県 広島県 山口県
    徳島県 香川県 愛媛県 高知県
    福岡県 佐賀県 長崎県 熊本県 大分県 宮崎県 鹿児島県
    沖縄県)
PREFECTURE_NAMES.each do |t|
  PrefectureId.create(
      name: t
  )
end