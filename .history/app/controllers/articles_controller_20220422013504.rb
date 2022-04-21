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
  end

  def update
  end
end
