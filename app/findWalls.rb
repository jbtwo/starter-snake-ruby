



# did I need to define a class here? Could module have worked instead? Seemed like either were necessary to access methods and variables in other file

module WallLogic
  # allows var to be accessed outside class
  cattr_accessor :exclude_walls

  # self to define class method
  def self.findWalls(my_snake,boardWidth,boardHeight)

    # puts my_snake
    
    # initialize array of moves that will cause death
    exclude_walls = []

    # # Find nearby walls, exclude those directions

    # #check left
    exclude_walls.push('left') if my_snake.head[:x] == 0

    # #check right
    exclude_walls.push('right') if my_snake.head[:x] + 1 == boardWidth

    # #check down
    exclude_walls.push('down') if my_snake.head[:y] == 0

    # #check up
    exclude_walls.push('up') if my_snake.head[:y] + 1 == boardHeight

    exclude_walls

  end
end
