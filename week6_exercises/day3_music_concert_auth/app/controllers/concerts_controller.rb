class ConcertsController < ApplicationController
	def index
		@concerts = Concert.all.order("created_at DESC")

	end

	def new
		@concert = Concert.new
	end

	def create
		@concert = Concert.new(concert_params)

	    if @concert.valid?
	      @concert.save
	      redirect_to concerts_path, notice: 'Project was successfully created.'
	    else
	      render :new
	    end

	end

	def show
		@concert = Concert.find_by(id: params[:id]) ||
      		render_404(params)
      	@comment = Comment.new
      	@comments = Comment.all
	end

	

	def destroy
	end

	def self.clean_old(date = Time.current)
    	where("created_at < ?", date).destroy_all
 	end

	private

	def concert_params
		params.require(:concert).permit(:band, :description, :city, :price, :date, :venue)
	end


end
