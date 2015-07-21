# # SL3. The online calculator

# # We are in the Internet era, so everything goes online. We order stuff online,
#  we watch TV shows online, we buy music online, we even
# # change the world through Twitter… so why not calculating online?
#  Does it make sense? (Einstein silently agrees).

# # Decided: we will implement a simple calculator so first grade students
#  can use it from their iPhones while doing their exams. You will think:
# # "but iOS and Android have a built-in calculator! Are you crazy?”.
#  Well, it definitely has, but OURS IS ONLINE!!!

# # So, our Online Calculator will:
# # * Have a home page (‘/‘) where you see all four available operations: 
# add, substract, multiply and divide. Pretty simple stuff.
# # * For each one of the available operations, we will have a form with 
# two input fields and a button, which will go to another URL/route and
# # display the result, like “The multiplication of 4 and 15 is 60” or 
# “The addition of 10 and 39 is 49".
# # * There will also be a link, in the home page, that goes to ‘/counting’ 
# and should display the numbers from 1 to 200, one number per line.

# # Feel free to add more features! :D
require 'sinatra'
require 'sinatra/reloader'

set :port, 3123
set :bind, '0.0.0.0'

numbers ||= []

get '/' do
	@numbers = numbers
	erb :operations
end

get '/result' do
	@numbers = numbers
	erb :result
end

post '/add' do
	p params
 	numbers << params["add1"].to_i
 	numbers << params["add2"].to_i
    numbers = numbers.inject(:+)#numbers[0] + numbers[1]
  	redirect('/result')
  	numbers = []
end

post '/substract' do
 	numbers << params["subs1"].to_i
 	numbers << params["subs2"].to_i
    numbers = numbers.inject(:-)
  	redirect('/result')
end

post '/multiply' do
 	numbers << params["mult1"].to_i
 	numbers << params["mult2"].to_i
    numbers = numbers.inject(:*)
  	redirect('/result')
end

post '/divide' do
 	# numbers << params["div1"].to_i
 	# numbers << params["div2"].to_i
    numbers = params["div1"].to_i / params["div2"].to_i
  	redirect('/result')
end


__END__

class solution

require 'sinatra'
require 'sinatra/reloader'

set :port, 3133

get '/' do
  erb :calculator
end

post '/calculate' do
  action = params[:action]
  number_one = params[:number_one].to_i
  number_two = params[:number_two].to_i

  @result = case action
  when 'add'
    number_one + number_two
  when 'substract'
    number_one - number_two
  when 'multiply'
    number_one * number_two
  when 'divide'
    number_one / number_two
  end

  erb :result
end

