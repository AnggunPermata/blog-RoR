class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destory] #this will caused set_article to start when the method is used

    def show
        # byebug
    end
    
    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create
        @article = Article.new(article_param)
        if @article.save 
            flash[:notice] = "Article was created successfully."
            redirect_to @article #redirect to show
        else
            render 'new'
        end
    end

    def update
        if @article.update(article_param)
            flash[:notice] = "Article was updated successfully."
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path #this will redirect to route ip_address/articles
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_param
        params.require(:article).permit(:title, :description)
    end

end