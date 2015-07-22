class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
		@user = User.find(params[:user_id])

	end

	def show_product
		@product = Product.find(params[:id])
		@reviews = Review.all.order(created_at: :desc)
		@review = Review.new
	end

	def new
		@user = User.find(params[:user_id])
		@product = @user.products.new
	end

	def create
		@user = User.find(params[:user_id])
		@product = Product.new(product_params)

		if @product.valid?
			@product.save
		redirect_to user_path(@user), notice: 'Product was created succesfully for you!'
	    else
	    	render :new
	    end
	end

	def destroy

		@user = User.find_by(id: params[:user_id])
	    @product = Product.find_by(id: params[:id]).try(:destroy)

	    redirect_to user_path(@user), notice: "Product #{@product} was succesfully destroyed"
	end


	private
  # Never trust parameters from the scary internet, only allow the white list through.
	def product_params
		params.require(:product).permit(:title, :user_id,:description,:bidding_deadline)
	end
end
