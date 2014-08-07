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

post '/move' do
	output = ""
	(0...9).each do |tile|
		if params["move_choice" + tile.to_s + ".0"] == ""
				output = tile.to_s
		end 
	end
	output
end

post '/game' do
	
	board_size = params[:board_size].to_i
	board = TicTacToe::Board.new(board_size*board_size)
	temp_tiles = ['X', nil,nil,'O',nil,nil,'X',nil,nil]
	board.set_tiles(temp_tiles)
	erb :board, :locals => {:board => board}
end
