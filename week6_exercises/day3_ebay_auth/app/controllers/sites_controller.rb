class SitesController < ApplicationController
	def home
		@products = Product.all
	end

end
