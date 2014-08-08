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
	index = -1
	output = ""
	(0...9).each do |tile|
		if params.key("") == ("move_choice" + tile.to_s + ".0")
				index = tile
		end 
	end
	output
	str_board = params.key("")[15..-1].to_s
	new_tiles = string_board_to_array(str_board)
	(0...9).each do |tile|
		if params.key("") == ("move_choice" + tile.to_s + ".0")
				new_tiles[tile] = 'X'
		end 
	end
	#new_tiles[index] = 'X'
	new_board = TicTacToe::Board.new(new_tiles.length)
	new_board.set_tiles(new_tiles)
	#index.to_s
	new_board.tiles.to_s
	#erb :board, :locals => {:board => new_board}
end

post '/game' do
	#TicTacToe::Game.new(SinatraUI.new)
	board_size = params[:board_size].to_i
	board = TicTacToe::Board.new(board_size*board_size)
	temp_tiles = ['X', nil,nil,'O',nil,nil,'X',nil,nil]
	board.set_tiles(temp_tiles)
	erb :board, :locals => {:board => board}
end

def string_board_to_array(str_board)
	board = Array.new(str_board.length)
	(0...str_board.length).each do |tile|
		if str_board[tile] == '-'
			board[tile] = nil
		elsif (str_board[tile] == 'X' || str_board[tile] == 'O')
			board[tile] = str_board[tile].to_s
		else

		end
	end
	board


end
