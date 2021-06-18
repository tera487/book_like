class Users::UsersController < ApplicationController
  before_action :authenticate_user!
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
end
