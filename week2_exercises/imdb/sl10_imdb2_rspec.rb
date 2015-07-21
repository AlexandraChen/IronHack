require 'rspec'
require_relative "./sl10_imdb2.rb"

describe Imdb2 do
	before do
		@tv = Imdb2.new
	end

	describe "#search_title" do
		it "should return the number of series with that title" do
			expect(@tv.search_title("Cat")).to eq(200)
		end
	end

	describe "#most_seasons_from" do
		
		it "should return the serie with more seasons" do
			expect(@tv.most_seasons_from(["Breaking Bad", "Friends", "Game of Thrones", "The Office"])).to eq("Friends")
		end
	end

	describe "#most_episodes" do
		it "should return the show with more episodes" do
			expect(@tv.most_episodes(["Breaking Bad","Game of Thrones"])).to eq("Breaking Bad")
		end
	end

	describe "#best_rating" do
		it "should return the best movie with the higher rating" do
			expect(@tv.best_rating(["Breaking Bad", "Pacific Blue", "The Affair", "The Affair"])).to eq("Breaking Bad")
		end
	end

  	describe "#top_movies" do
    	it "should return hash of top movies with ratings until given number" do
      		expect(@tv.top_movies(4)).to eq({'Shawsank Redemption' => 9.2,'The Godfather' => 9.2,'The Godfather II' => 9.0,'The Dark Knight' => 8.9})
    	end
 	end

end
