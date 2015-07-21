require 'sinatra'
require 'sinatra/reloader'

set :port, 3121
set :bind, '0.0.0.0'

enable :sessions
users ||= []

get '/' do
  @users = users
  id = session[:id]
  @current_user = @users[id.to_i]
  erb :home
end

post '/signup' do
   username = params[:username]
   users << params[:username]  
   session[:id] = users.index(username)
   redirect to('/')
end

get '/cats' do
  erb :cats
end