FactoryBot.define do
  factory :book do
    isbn { "9784761270438" }
    title { "エッセンシャル思考" }
    author { "グレッグ・マキューン/高橋璃子" }
    url { "https://books.rakuten.co.jp/rb/13023858/" }
    image_url { "https://thumbnail.image.rakuten.co.jp/@0_mall/book..." }
  end
end
