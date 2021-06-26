class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    @books = Book.new
  end

  def read_books
    @user = User.find(params[:id])
    @books = @user.users.order(created_at: :desc)
    @books = Kaminari.paginate_array(@books).page(params[:page])
  end
end
