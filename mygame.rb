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

	str_board = params.key("")[((params.key("").length > 31) ? 16 : 15)..-1].to_str
	new_tiles = string_board_to_array(str_board)
	(params.key("").length > 31 ? new_tiles[params.key("")[11,2].to_i] = 'X' : new_tiles[params.key("")[11].to_i] = 'X')
	new_board = TicTacToe::Board.new(new_tiles.length)
	new_board.set_tiles(new_tiles)

	computer = TicTacToe::Recursive_computer.new
	if new_tiles.compact.length != new_tiles.length && !new_board.over
		new_board.turn=(false)
		new_tiles[computer.turn(new_tiles) - 1] = 'O'
	else
		new_board.turn=(true)
		#redirect '/'
	end
	new_board.set_tiles(new_tiles)
	erb :board, :locals => {:board => new_board}

end

post '/game' do
	#TicTacToe::Game.new(SinatraUI.new)
	board_size = params[:board_size].to_i
	board = TicTacToe::Board.new(board_size*board_size)
	temp_tiles = Array.new(board_size*board_size,nil)
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
