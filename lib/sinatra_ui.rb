class Sinatra_UI

def print_winner(board)
		if board.tie?
			"<h1> It's a Tie!! </h1>"
		elsif board.get_winner == 'X'
			"<h1> Congratulations, You win! </h1>"
		else
			"<h1> Sorry, the Computer is the winner... </h1>"
		end
end


def print_player_turn
		"<h1> It's your move! </h1>"
end

def please_wait
	"<h1> The Computer is deciding, please wait! </h1>"
end


end