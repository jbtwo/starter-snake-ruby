require_relative 'findWalls.rb'
require_relative 'findSelf.rb'
require_relative 'findOther.rb'
require_relative 'snake.rb'
require_relative 'findFood.rb'

class MoveLogic
  def self.move(request)
    # start with arr of possible moves
    possible_moves = %w[up down left right]

    # separate objects in request hash
    board = request[:board]
    you = request[:you]
    boardWidth = board[:width]
    boardHeight = board[:height]
    food = board[:food]

    # build array of all snakes
    hash_snakes = board[:snakes]

    # compare snakes in array to find mine and opponent snakes
    hash_snakes.each do |snake|
      if snake[:id] == you[:id]
        @my_snake = Snake.new(snake)
      else
        # todo: account for multiple snakes
        @opp_snake = []
        @opp_snake.push(Snake.new(snake))
      end
    end

    # call findWalls method from WallLogic class, add to excluded_moves array
    excluded_moves =
      WallLogic.findWalls(@my_snake, boardWidth, boardHeight) +
        SelfLogic.findSelf(@my_snake) +
        OtherLogic.findOther(@my_snake, @opp_snake)

    # subtract excluded wall moves from all possible
    possible_moves -= excluded_moves # up, down

    puts "possible:" + possible_moves.to_s
    # call findFood and compare to possible moves      
    valid_food_moves = FoodLogic.findFood(@my_snake,possible_moves,food) & possible_moves

    puts "valid:" + valid_food_moves.to_s

    # use valid_food_move if present
    if valid_food_moves.length > 0
      @move =  valid_food_moves.sample
    elsif
      @move = possible_moves.sample
    end

    puts "Turn ##{request[:turn].to_s}  - MOVE: " + @move

    { "move": @move }
    

  end
end
