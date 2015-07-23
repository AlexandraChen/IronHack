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

	def edit
    @review = Review.find(params[:id]) ||
    render_404(params)
    @product = Product.find(@review.product_id)
  end

	def update
		@review = Review.find(params[:id])
		@product = Product.find(@review.product_id)
		if @review.update_attributes(review_params)
			redirect_to product_path(@review.product_id), notice: "Review succesfully updated"
		else
			render :edit
		end
	end

	private
	def review_params
		params.require(:review).permit(:description, :product_id)
	end

end

