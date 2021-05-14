require_relative 'findWalls.rb'
require_relative 'findSelf.rb'
require_relative 'snake.rb'

class MoveLogic
  cattr_accessor :possible_moves

  # start with arr of possible moves, @@ to make class var
  @@possible_moves = %w[up down left right]

  def self.move(request)

# todo: separate board and you objects. make sure those are passed to logic methods 

    board = request[:board]
    you = request[:you]
    boardWidth = board[:width]
    boardHeight = board[:height]

    puts boardWidth

    # hash_snakes = board[:snakes]
    # puts board.keys
    # print hash_snakes

    board_snakes = []

    # hash_snakes.each do { |i| 
    #   board_snakes.push(Snake.new(hash_snakes[i])) }
    
       
    puts board_snakes
    
    # mySnake = board[:you]
    # compare mySnake vs the 'other' snakes?
    # pop mySnake off other_snakes

    # call findWalls method from WallLogic class
    WallLogic.findWalls(you,boardWidth,boardHeight)

    # subtract excluded wall moves from all possible
    calculated_moves = @@possible_moves - WallLogic.exclude_walls

    move = calculated_moves.sample

    # puts "MOVE: " + move

    { "move": move }
  end
end
