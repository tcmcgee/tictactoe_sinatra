class BoardPresenter
	def self.make_board(board)
		board_size = board.tiles.length
		html_string = ""
		html_string += '<div id="board">'
		html_string += '<table>'
		counter = 0
    	(0...board_size).each do |row|
      		html_string += '<tr id="row' + row.to_s + '">'
     		(0...board_size).each do |column|

        		html_string += '<td class="square r' + ((row != board_size - 1) ? row.to_s : 'l') + ' c' + ((column != board_size - 1) ? column.to_s : 'l') + '"><input class = "bu bu' + (row * board_size + column).to_s + '"type="button" value="' + (row * board_size + column).to_s + '"></td>'
      			counter += 1
      		end
      		html_string += '</tr>'

    	end
    	html_string += '</table>'
  		html_string += '</div>'
	end
end