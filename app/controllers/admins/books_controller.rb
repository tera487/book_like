class Admins::BooksController < ApplicationController
  before_action :authenticate_admin!

  def show
    @user = User.new
    @books = Book.find(params[:id])
    @posts = @books.posts.order(created_at: :desc)
  end
end
