class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index 
    @articles = Article.all
  end

  def show

  end

  def new
    @article = Article.new
  end

  def edit

  end

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html {redirect_to article_url(@article), notice: "Article was successfully created."}
        format.json {render :show, status: :created, location: @article}
      end
    end

  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params 
    params.require(:article).permit(:title,:description)
  end

end
