class Sinatra_UI

	def print_winner(board)
		increment_games_completed
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

	def print_games_completed
			file = File.open("./public/games_completed.txt", "r")
			counter = file.read
		"<h1> Games Completed: " + counter.to_s + " </h1>"
	end


def increment_games_completed
	updated_counter = 1
	file = File.open("./public/games_completed.txt", "r") do |f|
		counter = f.read
		updated_counter += counter.to_i
	end
	file2 = File.open("./public/games_completed.txt", "w") do |f2|
		f2.puts(updated_counter.to_s)
	end
end


end