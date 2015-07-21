require 'rspec'
require_relative "./sl12_crazynumbers.rb"

describe Numbermaster do
	before do
		@number_master = Numbermaster.new
	end

	describe "#sign_of_most" do

		it "should return nil if array is empty" do
			expect(@number_master.sign_of_most([])).to eq(nil)
		end

		it "should return nil if positive == negative " do 
			expect(@number_master.sign_of_most([1,2,-1,-2])).to eq(nil)
		end

		it "should return postivie if positive > negative " do 
			expect(@number_master.sign_of_most([1,2,0,-2])).to eq([1,2])
		end

		it "should return negative if positive < negative " do 
			expect(@number_master.sign_of_most([1,-3,-4,-2])).to eq([-3,-4,-2])
		end

	end

	describe "#stat_calculator" do
		it "should return mode, median, mean, length of a given array" do
			expect(@number_master.stat_calculator([1,2,3,4,5])).to eq([[1,2,3,4,5],3,3,5])
		end

		it "should return mode, median, mean, length of a given array" do
			expect(@number_master.stat_calculator([1,2,3,3,4,4,5,6])).to eq([[3,4],3.5,3.5,8])
		end

		it "should return mode, median, mean, length of a given array not fully composed by numbers" do
			expect(@number_master.stat_calculator([1,2,"a",3,"x",3,4,5])).to eq([[3],3,3,6])
		end

		it "should return nil when array is empty" do
			expect(@number_master.stat_calculator([])).to eq(nil)
		end

		it "should return nil when array is not composed by numbers" do
			expect(@number_master.stat_calculator(["c", "e", "r"])).to eq([nil, nil, nil, nil])
		end

	end

  	describe "Fibonacci tests" do

	    it "should return (610) for n = 15" do
	      expect(@number_master.fibonacci(15)).to eq(610)
	    end

	    it "should return (75025) for n = 25 " do
	      expect(@number_master.fibonacci(25)).to eq(75025)
	    end

	    it "should return (102334155) for n = 40 " do
	      expect(@number_master.fibonacci(40)).to eq(102334155)
	    end

	    it "should return (1548008755920) for n = 60 " do
	      expect(@number_master.fibonacci(60)).to eq(1548008755920)
	    end
  	end
end

__END__
context "mode" do 
			it "should return the mode of the given array" do
				expect(@number_master.mode([1,2,3,3,3,3,4,5])).to eq([3])
			end

			it "should return the modeS of the given array" do
				expect(@number_master.mode([1,2,2,2,2,3,3,3,3,4,5])).to eq([2,3])
			end

			it "should return the mode of numbers if the array is not fully composed by numbers" do
				expect(@number_master.mode([1, "b", "b"])).to eq([1])
			end

			it "should return nil if the array is not composed by numbers" do
				expect(@number_master.mode(["a", "b", "b"])).to eq(nil)
			end

			it "should return nil if the array is empty" do
				expect(@number_master.mode([])).to eq(nil)
			end
		end

		context "median" do 
			it "should return the median of the given unsorted array (odd)" do
				expect(@number_master.median([4,2,5,3,1])).to eq(3)
			end

			it "should return the median of the given sorted array (odd)" do
				expect(@number_master.median([1,2,3,4,5])).to eq(3)
			end

			it "should return the median of the given unsorted array (even)" do
				expect(@number_master.median([4,2,5,3,1,6])).to eq(3.5)
			end

			it "should return the median of the given sorted array (even)" do
				expect(@number_master.median([1,2,3,4,5,6])).to eq(3.5)
			end

			it "should return the median of numbers if the array is not fully composed by numbers" do
				expect(@number_master.median([1, "b", "b"])).to eq(1)
			end

			it "should return nil if the array is not composed by numbers" do
				expect(@number_master.median(["a", "b", "b"])).to eq(nil)
			end

			it "should return nil if the array is empty" do
				expect(@number_master.median([])).to eq(nil)
			end
		end

		context "mean" do 
			it "should return the mean of the given array" do
				expect(@number_master.mean([1,2,3,4,5])).to eq(3)
			end

			it "should return the mean of numbers if the array is not fully composed by numbers" do
				expect(@number_master.mean([1, "b", "b"])).to eq(1)
			end

			it "should return nil if the array is not composed by numbers" do
				expect(@number_master.mean(["a", "b", "b"])).to eq(nil)
			end

			it "should return nil if the array is empty" do
				expect(@number_master.mean([])).to eq(nil)
			end
		end
