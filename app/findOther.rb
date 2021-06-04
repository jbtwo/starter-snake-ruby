module OtherLogic
  cattr_accessor :exclude_other

  def self.findOther(my_snake, opp_snake)
    exclude_other = []

    # loop through each body element

    # todo inject dat shit
    opp_snake.each do |snake|

      snake.body.each do |body|

        # NOT right
        if my_snake.head[:x] == body[:x] + 1 && body[:y] == my_snake.head[:y]
          exclude_other.push('left')
        end

        # NOT left
        if my_snake.head[:x] == body[:x] - 1 && body[:y] == my_snake.head[:y]
          exclude_other.push('right')
        end

        # NOT down
        if my_snake.head[:y] == body[:y] + 1 && body[:x] == my_snake.head[:x]
          exclude_other.push('down')
        end

        # NOT up
        if my_snake.head[:y] == body[:y] - 1 && body[:x] == my_snake.head[:x]
          exclude_other.push('up')
        end
      end
    end

    exclude_other
  end
end
