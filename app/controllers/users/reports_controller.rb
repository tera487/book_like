class Users::ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :post_set, except: [:index, :show]
  def create
    current_user.reports.find_or_create_by(post_id: params[:post_id])

    respond_to do |format|
      format.html {redirect_to @post}
      format.js { @msg = "通報しました！",@report = Report.find_by(user_id: current_user.id, post_id: @post) }
    end
  end

  def destroy
    current_user.reports.find_by(post_id: params[:post_id]).destroy
    
    respond_to do |format|
      format.html {redirect_to @post}
      format.js { @msg = "通報を取り消しました"}
    end
  end

  def index
    @reports = Post.reports.order(created_at: :desc)
  end

  def show
    @post = Report.find(params[:id])
  end


  private
  def post_set
    @post = Post.find(params[:post_id])
  end

end
