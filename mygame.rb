require 'sinatra'

set :public_folder, 'public'

get '/hello_world' do
  redirect 'images/twitter.gif'
end

get '/' do
  erb :board
end