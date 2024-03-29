class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
    # render json: {status: 'success',message:'Loaded articles',data:@articles},status: :ok render JSON
  end

  def show; end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:notice] = "Article was Created Successsfully"
      redirect_to articles_path
    else
      render "new"
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was Updated Successfully"
      redirect_to articles_path
    else
      render "edit"
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was Deleted Successfully"
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def require_same_user
    if current_user != @article.user
      flash[:alert] = "You can only edit or delete your own articles"
      redirect_to @article
    end
  end
end
