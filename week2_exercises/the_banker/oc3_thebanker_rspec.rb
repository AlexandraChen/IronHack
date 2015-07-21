require 'rspec'
require_relative './oc3_thebanker.rb'


describe TheBanker do

	describe "#self.convert" do
	    context "from or to Euros" do
		    it "should return usd from euros" do
		    	expect(TheBanker.convert(100,:eur,:usd)).to eq(128.356)
		    end
		    it "should return euros from usd" do
		        expect(TheBanker.convert(100,:usd,:eur)).to eq(77.818)
		    end
	    end

	    context "from USD to non Euros" do
	    	it"should return usd to gbp" do
	    		expect(TheBanker.convert(100,:usd,:gbp)).to eq(61.07001)
	    	end
	    	it"should return gdp from usd" do
	    		expect(TheBanker.convert(100,:gbp,:usd)).to eq(163.449813)
	    	end
	    end
	end
end

__END__

