class Admins::PostsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @user = User.new
    @posts = Post.order(created_at: :desc)
  end

  
end
