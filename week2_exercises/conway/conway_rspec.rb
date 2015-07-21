require 'rspec'
require_relative './conway.rb'

describe Cell do 

    describe '#regenerate' do
	  	context "Dead cells" do
	  		it "should stay dead if it has 0 neighbours" do
		      cell1 = Cell.new(0, [0,0,0,0,0,0,0,0])
		      expect(cell1.regenerate).to eq(0)
		    end
		    it "should regenerate alive if it has exactly three live neighbours" do
		      cell1 = Cell.new(0, [0,0,0,0,0,1,1,1])
		      expect(cell1.regenerate).to eq(1)
		    end
	  	end
	    
	  	context "Live cells" do
	  		it "regenerates a live cell from a live cell if it has 2 neighbours" do
		      cell1 = Cell.new(1, [0,0,0,0,0,0,1,1])
		      expect(cell1.regenerate).to eq(1)
		    end
		    it "should return dead if it has more than three neighbours" do
		      cell1 = Cell.new(1, [0,0,1,0,0,1,1,1])
		      expect(cell1.regenerate).to eq(0)
		    end
		    it "Should return dead if it has less than two neighbours" do
		   		cell1 = Cell.new(1, [0,0,0,0,0,0,0,1])
		      	expect(cell1.regenerate).to eq(0)
		    end
		    it "should regenerate live if has three neighbours" do
		      cell1 = Cell.new(1, [0,0,0,0,0,1,1,1])
		      expect(cell1.regenerate).to eq(1)
		    end 	

	  	end
    end
end