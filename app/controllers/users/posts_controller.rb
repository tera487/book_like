class Users::PostsController < ApplicationController
  before_action :authenticate_user! 
  before_action :articles_set, only: :index
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
      redirect_to users_user_path(current_user)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @like = Like.find_by(user_id: current_user.id, post_id: @post.id)
    @report = Report.find_by(user_id: current_user.id, post_id: @post)
    
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.assign_attributes(post_params)
    if @post.save
      redirect_to users_post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to users_user_path(current_user)
  end

  private 

  def post_params
    params.require(:post).permit(:content)
  end

  def articles_set
    @articles = Article.order(created_at: :desc)
  end
end
