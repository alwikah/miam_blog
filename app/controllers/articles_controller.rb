class ArticlesController < ApplicationController
  # TODO before_action :find_article, only: [:show, :edit, :update, :destroy]
  def index
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(articles_params)

    if @article.save
      redirect_to @article
    else
      render "New"
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
  end

  private

  def articles_params
    params.require(:article).permit(:title, :summary, :description, :author)
  end

  # def find_article
  #   @article = Article.find(params[:id])
  # end
end
