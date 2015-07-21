
require 'sinatra'
require 'sinatra/reloader'
require "pry"
require_relative './shouter.rb'

set :port, 3333
set :bind, '0.0.0.0'
	
enable :sessions



get('/') do
	session[:selected_handle] = nil
  	erb :mainpage
end

post('/shouts/new') do
	message = params[:message]
	params[:likes] ||= 0
	#user = User.all.find_by(handle: params[:handle]) #instance, which is not refering to the actual handle logged in
   	shout = Shout.create(message: message, user_id: session[:id], likes: params[:likes] )
   	redirect to('/shouts')
end


post('/signup') do
	name = params[:name]
	username = params[:handle]
	password = params[:password]
	new_user = User.create(name: name, handle: username, password: password)
	redirect to('/login')
end

get('/login') do
	erb :login
end

post ('/login') do
	password = params[:password]
	user = User.all.find_by_handle(params[:handle])

	if user === nil 
		redirect to ('/')
	elsif
		user.password === password
		session[:id] = user.id
		redirect to ('/shouts')
	end
	redirect to ('login')
	
end

get('/shouts') do
	@shouts = Shout.all.sort_by do |key,value|
		key[:likes]
	end.reverse
	user = User.all.find_by(session[:id])
	@user_handle = user.handle
	erb :new_shout
end

get('/logout')do
	session[:id] = nil
	redirect to ('/')
end

post('/likes') do
  shout = Shout.find(params[:id])
  shout.likes += 1
  shout.save
  redirect to ('/shouts')
end

get('/shouts/top')do
	@shouts = Shout.all.sort_by do |key,value|
		key[:likes]
	end.reverse

	user = User.all.find_by(session[:id])
	@user_handle = user.handle
	#binding.pry
	erb :best_shout

end

get('/shouters/top') do
 # sort through the shouters, find ther shouts and
 #  sum the likes, then return the shouter with more likes

  @user_likes = {}

  User.all.each do |user|
  	likes = 0
  	user.shouts.each do |shout|
  		likes += shout.likes
  	end
  	@user_likes[user.handle] = likes
  end

   @user_likes = @user_likes.sort_by do |key,value| 
  	value
  end.reverse

  erb :top_handle
  # Shouts.all.each do |shouts|
  # end
end

post('/:handle') do

	session[:selected_handle] = params[:selected_handle]

	redirect to ("/:handle")
	# @user = User.all.find_by(session[:id])
	# @user_handle = @user.handle

end


get ('/:handle') do
	@user = User.all.find_by(handle: session[:selected_handle])

	erb :handle
end







