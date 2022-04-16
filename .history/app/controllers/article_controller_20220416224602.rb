class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  
  def index 
    @articles = Article.all
  end

  def show

  end

end
