class ReviewsController < ApplicationController

	def create
		@product = Product.find(params[:product_id])
		@review = Review.new(review_params)

		if @review.valid?
			@review.save
			redirect_to product_path(@product), notice: 'Review succesfully posted!'
		else
			redirect_to '/', notice: 'Please enter a review before submitting'
		end
	end

	private
	def review_params
		params.require(:review).permit(:description, :product_id, :user_id)
	end

end
