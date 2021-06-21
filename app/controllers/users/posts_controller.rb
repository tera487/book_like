class Users::PostsController < ApplicationController
  before_action :authenticate_user! 
  def index
    @user = User.new
    @posts = Post.order(created_at: :desc)
    
  end

  def new
    @books = Book.find(params[:book_id])
    @post = Post.new
    
  end
  
  def create
    @books = Book.find(params[:book_id])
    @post = Post.new(post_params)
    @post.book = @books
    @post.user = current_user
    if @post.save
      redirect_to  users_user_path(current_user)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
  end

  private 
  def post_params
    params.require(:post).permit(:content)
  end
end
