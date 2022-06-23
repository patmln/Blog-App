class AuthorsController < ApplicationController
    before_action :set_author, only: [:show, :edit, :verify, :update, :destroy]

    def index
        @authors = Author.all
    end

    def show
    end

    def new
        @author = Author.new
    end

    def edit
    end
    
    def create
        @author = Author.new(author_params)
        if @author.save
            redirect_to @author
        else
            render :new
        end
    end

    def verify
        @author.toggle!(:is_verified)
        @author.save
        redirect_to @author
    end

    # def verify_date
    # end

    def update
        if @author.update(author_params)
            redirect_to @author
        else
            render :edit
        end
    end

    def destroy
        @author.destroy
        redirect_to authors_path
    end

    private

    def set_author
        @author = Author.find(params[:id])
    end

    def author_params
        params.require(:author).permit(:name, :address)
    end
end
