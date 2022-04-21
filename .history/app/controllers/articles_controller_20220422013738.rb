class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.new(article_params)
    if @article.save
    flash[:notice] = "Article was Created Successsfully"
    
    end
  end

  def update;



  end

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
