class Admins::ArticlesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @admin = Admin.new
    @articles = Article.order(created_at: :desc)
    @articles = Kaminari.paginate_array(@articles).page(params[:page])
  end

  def new
    @articles = Article.new
  end
  
  def create
    @articles = Article.new(article_params)
    @articles.admin = current_admin
    if @articles.save
      redirect_to  :admins_articles
    else
      render :new
    end
  end

  def show
    @articles = Article.find(params[:id])
    
  end
  
  def edit
    @articles = Article.find(params[:id])
  end
  
  def update
    @articles = Article.find(params[:id])
    @articles.assign_attributes(article_params)
    if @articles.save
      redirect_to admins_article_path(@articles)
    else
      render :edit
    end
  end
  
  def destroy
    @articles = Article.find(params[:id])
    @articles.destroy
    redirect_to :admins_articles
  end


  private 
    def article_params
      params.require(:article).permit(:article_title, :image,:article_content)
    end
  



end
