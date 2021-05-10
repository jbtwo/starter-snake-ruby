







def move(board)

  possible_moves = ["up", "down", "left", "right"]
  excluded_moves = []
  
  mySnake = board[:you]
  myHead = mySnake[:head]
  myHeadX = myHead[:x]
  myHeadY = myHead[:y]
  gameBoard = board[:board]

  # Find nearby walls, exclude those directions
  
  boardWidth = gameBoard[:width]
  boardHeight = gameBoard[:height]

  #check left
  if myHeadX == 0
     excluded_moves.push(0, "left")
     
  end
  #check right
  if myHeadX + 1 == boardWidth
    excluded_moves.push("right")
  end
  #check down
  if myHeadY == 0
    excluded_moves.push("down")
  end
  #check up
  if myHeadY + 1 == boardHeight
    excluded_moves.push("up")
  end

  possible_moves = possible_moves - excluded_moves

  puts possible_moves

  # Find head relative to body, exclude those directions


  move = possible_moves.sample
  
  
  # puts "MOVE: " + move
  { "move": move }
  
end
