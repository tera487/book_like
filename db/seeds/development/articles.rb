titles = %w{
  遊びたい 出かけたい デートしたい 本読みたい ゲームしたい パチンコ打ちたい 花火みたい 動物園行きたい ゴリラ飼いたい
}

bodys = %w{
  はやくコロナ落ち着かないかな 家での生活最高！ 東京タワー見に行きたい 遊園地行きたい 天気悪い モンハン欲しいな ガジェット欲しい
}


50.times do |n|
  ti = titles[n % 9]
  bd = bodys[n % 7]
  Article.create!(
    article_title: ti,
    article_content: bd,
    admin_id: 1
  )
end