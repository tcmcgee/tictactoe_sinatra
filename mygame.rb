require 'sinatra'
require './lib/presenters/board_presenter'
require './lib/presenters/option_presenter'
require 'bundler/setup'
require 'tic_tac_toe'

get '/hello_world' do
  File.read(File.join('views', 'image.html'))
end

get '/' do
  erb :index
end

post '/game' do
  board_size = params[:board_size]
  board = TicTacToe::Board.new(params[:board_size].to_i)
  temp_tiles = ['X',nil,nil,'O',nil,nil,'X',nil,nil]
  board.set_tiles(temp_tiles)
  erb :board, :locals => {:board => board}
end
