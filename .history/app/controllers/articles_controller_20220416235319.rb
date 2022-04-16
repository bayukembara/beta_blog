class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index 
    @articles = Article.all
  end
  def show

  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params 
    params.require(:article).permit(:title,:description)
  end

end
