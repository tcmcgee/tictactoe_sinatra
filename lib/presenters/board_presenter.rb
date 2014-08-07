class BoardPresenter
	def self.make_board(board)
		board_size = Math.sqrt(board.tiles.length)
		html_string = "<h1>" + board.tiles.to_s + " </h1>"
	
		html_string += '<div id="tttBoard">'
		html_string += '<table>'
		counter = 0
		tiles = board.get_board
		html_string += '<form class="move" action="/move" method="post">'
    	(0...board_size).each do |row|
      		html_string += '<tr id="row' + row.to_s + '">'
     		(0...board_size).each do |column|

        		html_string += '<td class="square r' + ((row != board_size - 1) ? row.to_s : 'l') + ' c' + ((column != board_size - 1) ? column.to_s : 'l') + '">
        		<input class = "bu" type=' + ((tiles[(row * board_size + column)].to_s == "") ? "submit " : "button " ) +  'name = "move_choice' + (row * board_size + column).to_s +  '" value="' + tiles[(row * board_size + column)].to_s + '"></td>'
      			counter += 1
      		end
      		html_string += '</tr>'

    	end
    	html_string += '</form>'
    	html_string += '</table>'
  		html_string += '</div>'
  		
	end
end