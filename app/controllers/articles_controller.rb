class ArticlesController < ApplicationController
  def index
    @articles = Article.all

    render json: article_json(@articles)
  end
  
  def show
    @article = Article.find(params[:id])

    render json: article_json(@article)
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      render json: article_json(@article), status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  private

  def article_json(article)
    article.as_json(methods: [:image_url, :article_likes, :article_dislikes, :comments_content, :comments_count])
  end
end
