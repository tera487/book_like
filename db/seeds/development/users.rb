User.create!(
  name: "tera",
  password: "testtest",
  email: "test@com.ja"
)


names = %w{
  ゴリラ 麒麟 ライオン 庶民 自動販売機 ニワトリ 貴族 ペットボトル スマホ
}

9.times do |n|
  name = names[n]
  User.create!(
    name: name,
    password: "testtest",
    email: "test@#{n}test.com"
  )
end