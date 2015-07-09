require 'sinatra'
require './lib/presenters/board_presenter'
require './lib/presenters/option_presenter'
require './lib/presenters/message_presenter'
require './lib/presenters/play_again_presenter'
require 'bundler/setup'
require 'tic_tac_toe'
require 'json'


public
before do
  headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
  headers['Access-Control-Allow-Origin'] = '*'
  headers['Access-Control-Allow-Headers'] = 'accept, authorization, origin'
  headers['Access-Control-Allow-Credentials'] = 'true'
end
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
	if new_tiles.length < 10
		computer = TicTacToe::Recursive_computer.new
	else
		computer = TicTacToe::Computer.new
	end

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

get '/get_ai_move' do
	server_computer = TicTacToe::Recursive_computer.new()
	json_board = request.query_string
	board = json_board_to_array(json_board)
	move = server_computer.turn(board)
	{ :move => move}.to_json
end

def json_board_to_array(json_board)

	json_board = json_board.gsub('%22','')
	json_board = json_board.gsub('[','')
	json_board = json_board.gsub(',','_')
	json_board = json_board.gsub(']','')
	board = json_board.split('_')
	board.collect! { |element|
		(element == "nil") ? nil : element
	}
	return board
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
