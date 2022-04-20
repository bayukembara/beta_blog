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

  # def edit

  # end

  def create
    #render plain: params[:articles] #to check the value of data that we want to submit
    @article = Article.new(params.require(:articles).permit(:title, :description))
    if @article.save
      flash[:notice] = "Article was created sucessfully"
    redirect_to articles_path
    else
      render 'new'
    end
  end

  # def update 

  # end

  # def create
  #   @article = Article.new(article_params)

  #   respond_to do |format|
  #     if @article.save
  #       format.html {redirect_to article_url(@article), notice: "Article was successfully created."}
  #       format.json {render :show, status: :created, location: @article}
  #     else
  #       format.html {render :new, status: :unprocessable_entity}
  #       format.json {render json: @article.errors, status: :unprocessable_entity}
  #     end
  #   end
  # end

  # def update
  #   respond_to do |format|
  #     if @article.update(article_params)
  #       format.html {redirect_to article_url(@article), notice: "Article was sucessfully updated."}
  #       format.json {render :show, status: :ok, location: @article}
  #     else
  #       format.html {render :edit, status: :unprocessable_entity}
  #       format.json {render json: @article.errors, status: :unprocessable_entity}
  #     end
  #   end
  # end

  # private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params 
    params.require(:article).permit(:title,:description)
  end

end
