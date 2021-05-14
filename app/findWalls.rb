



# did I need to define a class here? Could module have worked instead? Seemed like either were necessary to access methods and variables in other file

module WallLogic
  # allows var to be accessed outside class
  cattr_accessor :exclude_walls

  # self to define class method
  def self.findWalls(board,boardWidth,boardHeight)
    
    # array of moves that will cause death
    @@exclude_walls = []
    mySnake = board[:you]
    myHead = mySnake[:head]
    myHeadX = myHead[:x]
    myHeadY = myHead[:y]
    gameBoard = board[:board]

    # Find nearby walls, exclude those directions

    

    #check left
    exclude_walls.push(0, 'left') if myHeadX == 0

    #check right
    exclude_walls.push('right') if myHeadX + 1 == boardWidth

    #check down
    exclude_walls.push('down') if myHeadY == 0

    #check up
    exclude_walls.push('up') if myHeadY + 1 == boardHeight

  end
end
