class Users::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :articles_set, only: :show
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    @books = Book.new
  end

  def following
    @user  = User.find(params[:id])
  end

  def follower
    @user  = User.find(params[:id])
  end

  def read_books
    @user = User.find(params[:id])
    @books = @user.users.order(created_at: :desc).uniq
    @books = Kaminari.paginate_array(@books).page(params[:page])
  end

  private

  def articles_set
    @articles = Article.order(created_at: :desc)
  end
end
