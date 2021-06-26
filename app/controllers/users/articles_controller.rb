class Users::ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    # @admin = Admin.new
    @articles = Article.order(created_at: :desc)
    @articles = Kaminari.paginate_array(@articles).page(params[:page])
  end

  def show
    @articles = Article.find(params[:id])
  end
end
