class BoardPresenter
	def self.make_board(board)
		board_size = board.tiles.length
		html_string = ""
		html_string += '<div id="board">'
		html_string += '<table>'
    	(0...board_size).each do |row|
      		html_string += '<tr id="row#{row}">'
     		(0...board_size).each do |column|
        		html_string += '<td class="square r#{row} c#{column}"><input class = "bu"type="button" value=""></td>'
      		end
      		html_string += '</tr>'

    	end
    	html_string += '</table>'
  		html_string += '</div>'
	end
end