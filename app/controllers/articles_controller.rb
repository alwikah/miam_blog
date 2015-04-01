class ArticlesController < ApplicationController
  # TODO before_action :find_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.all.order("created_at DESC").paginate(page: params[:page], per_page: 10)
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
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(articles_params)
      redirect_to @article
    else
      render "Edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])

    @article.destroy
    redirect_to root_path
  end

  private

  def articles_params
    params.require(:article).permit(:title, :summary, :description, :author, :image)
  end

  # def find_article
  #   @article = Article.find(params[:id])
  # end
end
