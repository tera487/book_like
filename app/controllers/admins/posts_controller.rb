class Admins::PostsController < ApplicationController
  before_action :authenticate_admin!
  before_action :articles_set, only: :index
  def index
    @user = User.new
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    # @like = Like.find_by(user_id: current_user.id, post_id: @post.id)
    # @report = Report.find_by(user_id: current_user.id, post_id: @post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :admins_root
  end

  def reports_posts
    @posts = Report.order(created_at: :desc)
  end

  private

  def articles_set
    @articles = Article.order(created_at: :desc)
  end
end
