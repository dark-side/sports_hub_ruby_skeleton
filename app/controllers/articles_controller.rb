class ArticlesController < ApplicationController
    def index
        @articles = Article.all

        render json: @articles.as_json(methods: [:image_url, :article_likes, :article_dislikes])
    end
    
    def show
        @article = Article.find(params[:id])

        render json: url_for(@article.image)
    end

    def create
        @article = Article.new(article_params)

        if @article.save
            render json: @article, status: :created
        else
            render json: @article.errors, status: :unprocessable_entity
        end
    end
end
