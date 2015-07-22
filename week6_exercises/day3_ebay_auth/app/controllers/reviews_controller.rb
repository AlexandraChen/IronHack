class ReviewsController < ApplicationController

	def create
		@review = current_user.reviews.new(review_params)

		if @review.valid?
			@review.save
			redirect_to product_path(@review.product), notice: 'Review succesfully posted!'
		else
			redirect_to product_path(@review.product), notice: 'Something went wrong :( Please try again'
		end
	end

	private
	def review_params
		params.require(:review).permit(:description, :product_id)
	end

end
