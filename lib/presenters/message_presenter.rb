require_relative '../sinatra_ui'
class MessagePresenter
	@ui = Sinatra_UI.new

	def self.get_status_message(board)	
	  if board.over
	  	@ui.print_winner(board)
	  else
		@ui.print_player_turn
	  end
	end	

	def self.get_games_completed()
		@ui.print_games_completed()
	end	

end