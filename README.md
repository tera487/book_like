# BookLike
BookLikeは、本の気づきを共有、発見するSNSアプリです。

URL: https://www.book-like.com

<img width="1438" alt="book_like_image" src="https://user-images.githubusercontent.com/64579170/125240371-fc878600-e324-11eb-9283-34659dae7eb9.png">


# 開発背景

 大学生になってから、ビジネス本や自己啓発本を読むようになりました。本を読むきっかけは、よりよい人生を生きていきたいと思ったからです。しかし、本を読んでもその本の知識を日常生活に生かしきれていませんでした。このことから、本を読んで終わりではなく、本の知識を自分の知識として吸収し、日常生活で活用することで読書をする必要があると思いました。

そこで本の内容をアウトプットすることで、「本の知識が定着し、日常生活に生かしやすいのでは？」と考えました。そして本の感想や気づきを呟き、また他人の感想から新たな学びが生まれると思い、『BookLike』を開発しようと思いました。


# 使用技術

* フロントエンド
  - HTML/CSS
  - JavaScript（jQuery）
  - Bootstarp 5.0

* バックエンド
  - Ruby 2.6.6
  - Rails 6.1.4
  - Mysql 8.0.25
 
* インフラ
  - AWS(VPC、EC2、RDS for MySQL、S3、ALB、 IAM、Route53）
  - CircleCI (CI/CD)
  - Docker/docker-compose

* その他
    * Rubocop(コード整形）
    * Rspec（単体・統合テスト)
    * レスポンシブ化
    * お名前.com（独自ドメインの取得）

# ER図
<img width="632" alt="book_like_ER図" src="https://user-images.githubusercontent.com/64579170/130008946-ab185a06-5cad-4db6-b3fc-abfc7f8fa118.png">


# クラウド構成図
<img width="517" alt="book_like_infrastructure" src="https://user-images.githubusercontent.com/64579170/130009119-6a86b977-4eb5-4a4c-9b5b-5beb879ce06c.png">


# 機能一覧
* ユーザー関連
    * 新規登録機能・登録情報編集機能（画像登録可能）
    * ログイン機能
    * ゲストログイン機能
    * フォロー機能（非同期）
   
* 管理者関連
    * 管理者情報編集機能
    * 記事投稿・編集・削除
    * アカウント削除
    
* 投稿関連
    * 新規投稿・編集・削除
    * いいね機能（非同期）
    * 通報機能（非同期）

* 書籍関連
    * 書籍検索機能（楽天APIの利用）
    * 読んだ本一覧


# 今後実装したい項目

* 本番環境でのDockerコンテナの利用(ECS)
* Terraformでインフラをコード化
* SPAでの開発(vue.js React)


