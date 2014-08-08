require 'tic_tac_toe'
require_relative '../lib/sinatra_ui'

describe 'sinatra_ui' do
  describe 'print_winner' do
  	ui = Sinatra_UI.new
    it "returns an html message when the player has won and the game is over" do
      board = TicTacToe::Board.new(9)
      board.set_tiles(Array.new(9,'X'))
      board.turn=(true)

      ui.print_winner(board).should == "<h1> Congratulations, You win! </h1>"
    end
    it "returns an html message when the computer has won and the game is over" do
      board = TicTacToe::Board.new(9)
      board.set_tiles(Array.new(9,'O'))
      board.turn=(false)

      ui.print_winner(board).should == "<h1> Sorry, the Computer is the winner... </h1>"
    end

    it "returns an html message when there's a tie and the game is over" do
      board = TicTacToe::Board.new(9)
      tiles = ['X','O','X',
      		   'X','X','O',
      		   'O','X','O']

      board.turn=(true)
      board.set_tiles(tiles)

      ui.print_winner(board).should == "<h1> It's a Tie!! </h1>"
    end
  end
 describe 'print_player_turn' do
  	ui = Sinatra_UI.new
    it "returns a message to notify the player it is their turn" do
      board = TicTacToe::Board.new(9)
      board.set_tiles(Array.new(9,nil))

      ui.print_player_turn.should == "<h1> It's your move! </h1>"
    end
  end
end