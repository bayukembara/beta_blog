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
      flash[:notice] = 'Article was Created Successsfully'
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article was Updated Successfully'
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
