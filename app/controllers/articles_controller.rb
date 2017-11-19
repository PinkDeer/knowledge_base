class ArticlesController < ApplicationController

  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
    authorize @articles
  end

  def show
    @comments = Comment.where(article_id: @article)
  end

  def new
    @article = Article.new
    authorize @article
  end

  def create
      @article = Article.new(article_params)
      @article.user = current_user
      authorize @article

      respond_to do |format|
        if @article.save
          format.html { redirect_to @article, success: 'Article was successfully created.' }
          format.json { render :show, status: :created, location: @article }
        else
          format.html { render :new }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end


  def edit
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, success: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, success: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def find_article
      @article = Article.find(params[:id])
      authorize @article
    end

    def article_params
      params.require(:article).permit(:title, :content)
    end

end
