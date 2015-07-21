class SitesController < ApplicationController
	def index
		@concerts = Concert.all.where("date =?",Date.today)
		@current_month_concerts = Concert.all.where("date BETWEEN ? AND ?",Time.now, Time.now.end_of_month).order("date ASC")
	end
end
