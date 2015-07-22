class BidsController < ApplicationController
	
	def create
		@bid = Bid.new(bid_params)

		if @bid.valid?
			@bid.save
			redirect_to product_path(params[:product_id]), notice: "Bid succesfully posted!"
	    else
	    	redirect_to product_path(params[:product_id]), notice: "Unable to post bid. Try again!"
	    end
	end

	private
	def bid_params
		params.require(:bid).permit(:bidder_id, :amount, :product_id)
	end
end
