class CommentsController < ApplicationController
  def index
  	@comments = Comment.all
  end

  def create
  	@comment = Product.find(params[:productID]).comments.new
  	@comment.comment = params[:comment]

  	if @comment.save
  		redirect_to '/comments'
  	else
  		flash[:comment_errors] = @comment.errors.full_messages
  		redirect_to :back
  	end
  end
end
