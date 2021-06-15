class Users::PostsController < ApplicationController
  before_action :authenticate_user! 
  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end
end
