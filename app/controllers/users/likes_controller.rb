class Users::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :post_set

  def create 
    current_user.likes.find_or_create_by(post_id: params[:post_id])

    respond_to do |format|
      format.html {redirect_to :user_root}
      format.js { @like = Like.find_by(user_id: current_user.id, post_id: @post) }
    end

  end

  def destroy
    current_user.likes.find_by(post_id: params[:post_id]).destroy

    # Like.find_by(user_id: current_user.id, post_id: params[:id]).destroy
    
    respond_to do |format|
      format.html {redirect_to @post}
      format.js { @msg = "いいねを解除しました"}
    end
    
  end

  private
  def post_set
    @post = Post.find(params[:post_id])
  end
end
