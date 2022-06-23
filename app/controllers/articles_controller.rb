class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

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
        if @article.save
            redirect_to @article
        else
            render :new
        end
    end

    def update
        if @article.update(article_params)
            redirect_to @article
        else
            render :edit
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    def create_new
        article = Article.new
        create_title = PostCreator::Client.create[:data][Article.maximum(:id).to_i]['title']
        create_content = PostCreator::Client.create[:data][Article.maximum(:id).to_i]['body']
        article.update(title: create_title, content: create_content)
        if article.save
            redirect_to article
        end
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :content)
    end
end
