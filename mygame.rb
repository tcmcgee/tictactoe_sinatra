require 'sinatra'

set :public_folder, 'public'

get '/hello_world' do
  ##redirect 'images/twitter.gif'
  erb :image
end

get '/' do
  erb :board
end