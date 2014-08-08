require 'sinatra'
require './lib/presenters/board_presenter'
require './lib/presenters/option_presenter'
require './lib/presenters/message_presenter'
require './lib/presenters/play_again_presenter'
require 'bundler/setup'
require 'tic_tac_toe'


public
get '/hello_world' do
	File.read(File.join('views', 'image.html'))
end

get '/' do
	erb :index
end

post '/move' do

	str_board = get_string_board(params.key(""))
	new_tiles = string_board_to_array(str_board)
	new_tiles = place_player_move(new_tiles, params.key(""))
	new_board = TicTacToe::Board.new(new_tiles.length)
	new_board.set_tiles(new_tiles)
	computer = get_computer(new_board.tiles)

	if new_board.tiles.compact.length != new_board.tiles.length && !new_board.over
		new_board.turn=(false)
		new_tiles[computer.turn(new_tiles) - 1] = 'O'
	else
		new_board.turn=(true)
	end
	new_board.set_tiles(new_tiles)
	erb :board, :locals => {:board => new_board}
end

post '/game' do
	board_size = params[:board_size].to_i
	board = TicTacToe::Board.new(board_size*board_size)
	temp_tiles = Array.new(board_size*board_size,nil)
	board.set_tiles(temp_tiles)
	erb :board, :locals => {:board => board}
end

############################
#         HELPERS          #
############################

def get_computer(tiles)
	if tiles.length < 16
		return TicTacToe::Recursive_computer.new
	else
		return TicTacToe::Computer.new
	end
end

def place_player_move(new_tiles,param_name)
	if (param_name.length > 31) #31 is the last index before the index goes past 9 and pushes every character back one (only applicable to 4x4 boards)
		new_tiles[param_name[11,2].to_i] = 'X'
	else
		new_tiles[param_name[11].to_i] = 'X'
	end
	return new_tiles
end

def get_string_board(param_name)
	if (param_name.length > 31) 
		return param_name[16..-1]
	else
		return param_name[15..-1]
	end
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
