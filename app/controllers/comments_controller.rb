class CommentsController < ApplicationController
    before_action :get_article

    def index
        @comments = @article.comments
    end

    def new
        @comment = @article.comments.build
    end

    def create
        @comment = @article.comments.build(comment_params)

        if @comment.save
            redirect_to article_comments_path(@article.id)
        else
            render :new
        end
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
        if @comment.update(comment_params)
            redirect_to article_comments_path(@article.id)
        else
            render :edit
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to article_comments_path(@article.id)
    end

    def create_new
        @comment = @article.comments.build
        @create_body = CommentCreator::Client.create[:data][Comment.maximum(:id).to_i]['body']
        @comment.update(body: @create_body)
        if @comment.save
            redirect_to article_comments_path(@article.id)
        end
    end

    private

    def get_article
        @article = Article.find(params[:article_id])
    end

    def comment_params
        params.require(:comment).permit(:body)
    end
end