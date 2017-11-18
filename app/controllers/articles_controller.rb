class ArticlesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(post_params)
    if @article.save
			redirect_to @article
		else
			render 'new'
		end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def find_post
    end

    def post_params
      params.require(:article).permit(:title, :content)
    end

end
