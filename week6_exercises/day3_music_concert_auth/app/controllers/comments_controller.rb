class CommentsController < ApplicationController

	def new
		@comment = Comment.new
	end

	def create
		@concert = Concert.find(params[:concert_id])
		@comment = Comment.new(comment_params)

		if @comment.valid?
			@comment.save
			redirect_to concert_path(@concert), notice: 'Comment succesfully posted!'
		else
			redirect_to concert_path(@concert), notice: 'Please enter a comment before submitting'
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:comment, :name, :concert_id)
	end

end
