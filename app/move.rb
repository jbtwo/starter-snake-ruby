require_relative 'findWalls.rb'
require_relative 'findSelf.rb'
require_relative 'findOther.rb'
require_relative 'snake.rb'

class MoveLogic
  def self.move(request)
    # start with arr of possible moves
    possible_moves = %w[up down left right]

    # separate objects in request hash
    board = request[:board]
    you = request[:you]
    boardWidth = board[:width]
    boardHeight = board[:height]

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
    possible_moves -= excluded_moves

    # try some lookahead stuffs ############

    # for each remaining move, change head to new pos
    possible_moves.each do | move |

      if move == 'up'
        @my_snake.head[:y] + 1
      elsif move == 'down'
        @my_snake.head[:y] - 1
      elsif move == 'right'
        @my_snake.head[:x] + 1
      elsif move == 'left'
        @my_snake.head[:x] - 1
      end

    end

    move = possible_moves.sample

    # move = 'up'

    puts 'MOVE: ' + move

    { "move": move }
  end
end
