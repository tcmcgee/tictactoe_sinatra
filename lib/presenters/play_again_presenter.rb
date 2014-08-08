class PlayAgainPresenter
	def self.button(board)
		if board.over
			html_string = '<form class="again" action="/" method="get">'
			html_string	+= '<div><input class = "button" type="submit" name="play_again" value = "Play Again?"</div>'
			html_string	+= '</form>'
		else
			html_string = ""
		end
		html_string
	end
end