require_relative '../sinatra_ui'
class MessagePresenter
	def self.get_status_message(board)
		ui = Sinatra_UI.new
	  if board.over
	  	ui.print_winner(board)
	  else
			ui.print_player_turn

	  end

	end		

end