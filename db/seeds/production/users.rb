User.create!(
  name: "tera",
  password: "testtest",
  email: "test@com.ja"
)


names = %w{
  Roland Ben Mark 庶民 マイケル ガブリエル 貴族 レイ Riho
}

9.times do |n|
  name = names[n]
  User.create!(
    name: name,
    password: "testtest",
    email: "test@#{n}test.com"
  )
end