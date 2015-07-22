class TournamentsController < ApplicationController
  def index
  end

  def all
  	tournaments = Tournament.all
  	render json: tournaments
  end

  def create
  	tournament = Tournament.new(tournament_params)

  	if tournament.valid?
  		tournament.save
  		render json: tournament, status: 201
  	else
  		render :index
  	end

  end

  def destroy
  	tournament = Tournament.find(params[:id])
  	tournament.destroy
  	render json: tournament
  end

  private

  def tournament_params
  	params.require(:tournament).permit(:name)
  end

end
