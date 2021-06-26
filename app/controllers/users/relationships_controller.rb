class Users::RelationshipsController < ApplicationController
  before_action :set_user

  def create
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to users_user_path(@user) }
      format.js { @msg = "フォローしました" }
    end
  end

  def destroy
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to users_user_path(@user) }
      format.js { @msg = "フォローを解除しました" }
    end
  end

  private

  def set_user
    @user = User.find(params[:relationship][:follow_id])
  end
end
