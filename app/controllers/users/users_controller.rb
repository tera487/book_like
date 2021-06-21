class Users::UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    @books = Book.new
    @like = Like.find_by(user_id: @user.id, post_id: @posts.id)
  end
  
  def following
    @user  = User.find(params[:id])
  end
  
  def follower
    @user  = User.find(params[:id])
  end
  
  def read_books
    @user = User.find(params[:id])
    @books = @user.users.order(created_at: :desc)
    @books = Kaminari.paginate_array(@books).page(params[:page])
  end

end
