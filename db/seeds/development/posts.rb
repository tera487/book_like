bodys = %w{
  はやくコロナ落ち着かないかな 家での生活最高！ 東京タワー見に行きたい 遊園地行きたい 天気悪い モンハン欲しいな ガジェット欲しい
}

users = [1,2,3,4,5,6,7,8,9,10]

books = [9784478025819,9784761270438,9784478107829,9784837928430,9784866430812]

10.times do |n|
  bd = bodys[n % 7]
  ur = users[n % 10]
  book = books[n % 5]
  Post.create!(
    content: bd,
    book_id: book,
    user_id: ur
  )
end
