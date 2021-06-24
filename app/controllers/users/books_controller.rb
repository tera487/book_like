class Users::BooksController < ApplicationController
  before_action :authenticate_user!
  def search
  end

  def index
    #ここで空の配列を作ります
    @books = []
    @title = params[:title]
    # @author = params[:title]
    
    
    # if @author.present?
    #   #この部分でresultsに楽天APIから取得したデータ（jsonデータ）を格納します。
    #   #今回は書籍のタイトルを検索して、一致するデータを格納するように設定しています。
    #   results = RakutenWebService::Books::Book.search({
    #     author: @author
    #   })
    #   #この部分で「@books」にAPIからの取得したJSONデータを格納していきます。
    #   #read(result)については、privateメソッドとして、設定しております。
    #   results.each do |result|
    #     book = Book.new(read(result))
    #     @books << book
    #   end
    # end

    if @title.present?
      results = RakutenWebService::Books::Book.search({
        title: @title
      })

      results.each do |result|
        book = Book.new(read(result))
        @books << book
      end
    end

    #「@books」内の各データをそれぞれ保存していきます。
    #すでに保存済の本は除外するためにunlessの構文を記載しています。
    @books.each do |book|
      unless Book.all.include?(book)
        book.save
      end
    end
    
    @books = Kaminari.paginate_array(@books).page(params[:page])
    
  end


  def show
    @user = User.new
    @books = Book.find(params[:id])
    @posts = @books.posts.order(created_at: :desc)
  end
 

  private

  def read(result)
    title = result["title"]
    author = result["author"]
    url = result["itemUrl"]
    isbn = result["isbn"]
    image_url = result["mediumImageUrl"]

    {
      title: title,
      author: author,
      url: url,
      isbn: isbn,
      image_url: image_url
    }
  end
  
end
