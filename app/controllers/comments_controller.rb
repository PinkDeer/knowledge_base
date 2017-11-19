class CommentsController < ApplicationController

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(params[:comment].permit(:comment))
		@comment.user_id = current_user.id if current_user
		@comment.save

		if @comment.save
			redirect_to article_path(@article)
		else
			render 'new'
		end
	end

	def edit
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
	end

	def update
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])

		if @comment.update(params[:comment].permit(:comment))
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

end
