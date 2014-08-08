class BoardPresenter
	def self.make_board(board)
		board_size = Math.sqrt(board.tiles.length)
		html_string = ""
	
		html_string += '<div id="tttBoard">'
		html_string += '<table>'
		counter = 0
		tiles = board.get_board
		html_string += '<form class="move" action="/move" method="post">'
    	(0...board_size).each do |row|
      		html_string += '<tr id="row' + row.to_s + '">'
     		(0...board_size).each do |column|

        		html_string += '<td class="square r' + ((row != board_size - 1) ? row.to_s : 'l') + ' c' + ((column != board_size - 1) ? column.to_s : 'l') + '">
        		<input class = "bu" type=' + self.get_button_type(row,column,board) +  'name = "move_choice' + self.index(row,column,board_size) + '_' + self.tiles_to_s(tiles) +  '" value="' + self.get_tile(row,column,tiles) + '"></td>'
      			counter += 1
      		end
      		html_string += '</tr>'

    	end
    	html_string += '</form>'
    	html_string += '</table>'
  		html_string += '</div>'
  		
	end

  def self.index(row,column,board_size)
    return (row * board_size + column).to_s
  end

  def self.get_tile(row,column,tiles)
    return tiles[row * (Math.sqrt(tiles.length)) + column].to_s
  end

  def self.get_button_type(row,column,board)
    tile = board.tiles[(row * Math.sqrt(board.tiles.length)) + column]
    if (board.over)
      return "button "
    else
      if (tile.to_s == "")
        return "submit "
      else
        return "button "
      end
    end
  end

  def self.tiles_to_s(tiles)
    output = ""
    (0...tiles.length).each do |tile|
      if tiles[tile].to_s == ""
        output = output + "-"
      else
        output = output + tiles[tile]
      end
    end
    output
  end
end