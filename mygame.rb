require 'sinatra'

get '/hello_world' do
  File.read(File.join('views', 'image.html'))
end

get '/' do
  File.read(File.join('views', 'board.html'))
end
