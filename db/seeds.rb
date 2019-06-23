# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ユーザーaからzを作成
Rails.logger.debug 'create sample user data'

('a'..'z').each do |user|
  name = "ユーザー#{user}"
  email = "#{user}@#{user}.com"
  password = "testpass"
  password_confirmation = "testpass"
  uid = SecureRandom.uuid
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password_confirmation,
    uid: uid
  )
end

Rails.logger.debug 'create sample event data'

100.times do
  user_id = rand(1..26)
  name = "#{Faker::Food.dish} party"
  place = "渋谷 #{Faker::Color.color_name} ビル"
  image = ""
  date = Faker::Date.between(6.months.from_now, Time.zone.today)
  start_at = "19:00"
  end_at = "22:00"
  link_url = Faker::Fillmurray.image
  cost = "#{Faker::Number.number(2)}00".to_i
  capacity = "#{Faker::Number.number(1)}0".to_i
  meta = Faker::Marketing.buzzwords
  Event.create!(
    user_id: user_id,
    name: name,
    place: place,
    image: image,
    date: date,
    start_at: start_at,
    end_at: end_at,
    link_url: link_url,
    cost: cost,
    capacity: capacity,
    meta: meta
  )
end

## グループ、グループメンバーの作成
# ユーザーaからユーザーcがそれぞれグループを作成
1.upto(3) do |num|
  user_id = num
  name = "test group#{user_id}"
  summary = "#{name}summary"
  icon = ""
  group = Group.create!(
    name: name,
    summary: summary,
    icon: icon
  )

  # リーダーの加入情報を作成
  Join.create!(
    user_id: num,
    group_id: group.id,
    is_leader: true
  )
end

# 作成した３つのグループが、それぞれメンバーを招待
1.upto(3) do |num|
  # ランダムにグループメンバーを5名勧誘
  arr = [*1..26]
  arr.delete(num)
  5.times do
    member_id = arr.sample
    Join.create!(
      user_id: member_id,
      group_id: num,
      is_leader: false
    )
    arr.delete(member_id)
    # 招待メンバーがグループ内でコメントを投稿
    Comment.create!(
      user_id: member_id,
      group_id: num,
      text: "I luv #{Faker::Movie.quote} movie!!"
    )
  end
end
