class ArticlesController < ApplicationController
    
    def index
        @articles = Article.where(approval: true).order(created_at: :desc)
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(article_params_create) 
        if @current_user 
            @article.userid = @current_user.id
        else
            @article.userid = -1
        end
        @article.approval = :false
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end
    
    def approve
        @article = Article.find(params[:id]) 
        @article.approval = true
        
        if @article.save
            render :json => { 
               :id => @article.id
            }
        else
            render :json =>{
                :id=>"-1"
            }
        end
        
    end
    
    def delete
        Article.find(params[:id]).destroy
          render :json => { 
               :id => params[:id]
            }
    end
    
    def admin
        if (current_user.adminflag > 0)
            @articles = Article.where(:approval => [false, nil]).order(created_at: :desc)
        else 
            if current_user
                @articles = Article.where(:userid => current_user.id).order(created_at: :desc)
            else
                @articles = nil
            end
        end
    end
    
    private
    def article_params_create
        params.require(:article).permit(:title, :text, :image, :url)
    end
    
end
