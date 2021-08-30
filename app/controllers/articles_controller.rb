class ArticlesController < ApplicationController
  def index
  end

  def new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end
  
end
