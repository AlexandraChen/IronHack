class Numbermaster
	attr_accessor :stats_array

	def sign_of_most(numbers)
		return nil if !numbers.is_a?(Array) || numbers.empty?
		positive_numbers = numbers.select do |number| number > 0 end
		negative_numbers = numbers.select do |number| number < 0 end
		return positive_numbers if positive_numbers.length > negative_numbers.length
		return negative_numbers if negative_numbers.length > positive_numbers.length
	end

	def stat_calculator(numbers)
		return if !numbers.is_a?(Array) || numbers.empty?
		@stats_array = [mode(numbers), median(numbers), mean(numbers), size(numbers)]
	end

	def mode(numbers)
		hash_count = Hash.new(0)
		numbers.each do |i| 
			if i.is_a?(Numeric) 
				hash_count[i] += 1 
			end 
		end
		max_object = hash_count.max_by do |key, value| value end
		mode = hash_count.select do |k,v| v == max_object[1] end
		mode = mode.keys
		return mode if !mode.empty?
		return nil
	end

	def median(numbers)
		return if !numbers.is_a?(Array) || numbers.empty?
		numbers = numbers.select do |i| i.is_a?(Numeric) end
		return if numbers.empty?
		sorted_numbers = numbers.sort
		length = sorted_numbers.length
		if length.even?
			(sorted_numbers[(length-1)/2] + sorted_numbers[length/2]).fdiv(2)
		else
			sorted_numbers[length/2]
		end
	end

	def mean(numbers)
		return if !numbers.is_a?(Array) || numbers.empty?
		numbers = numbers.select do |i| i.is_a?(Numeric) end
		return if numbers.empty?
		mean = (numbers.reduce(:+)).fdiv(numbers.length)
		decimal = mean.to_s.split(".")
		if decimal[1] == "0"
			return decimal[0].to_i
		else
			return mean
		end
	end

	def size(numbers)
		numbers = numbers.select do |i| i.is_a?(Numeric) end
		return if numbers.empty?
		return numbers.length
	end

  	def fibonacci(n)
	    return 0 if n == 0
	    return 1 if n == 1

	    @fibonacci_cache ||={}
	    @fibonacci_cache[n] ||= (fibonacci(n-1)+(fibonacci(n-2)))
	end
end


