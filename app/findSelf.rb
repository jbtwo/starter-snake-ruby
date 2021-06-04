module SelfLogic
  cattr_accessor :exclude_self

  def self.findSelf(my_snake)

    # remove head from body array
    my_snake.body.delete(my_snake.head)
    
    exclude_self = []

    # loop through each body element

    my_snake.body.each do | body |

      # NOT right
      exclude_self.push('left') if my_snake.head[:x]  == body[:x] + 1 && body[:y] == my_snake.head[:y]
     
      # NOT left
      exclude_self.push('right') if my_snake.head[:x] == body[:x] - 1 && body[:y] == my_snake.head[:y]  

      # NOT down
      exclude_self.push('down') if my_snake.head[:y] == body[:y] + 1 && body[:x] == my_snake.head[:x]

      # NOT up
      exclude_self.push('up') if my_snake.head[:y] == body[:y] - 1 && body[:x] == my_snake.head[:x]

    end

    exclude_self



  end
end
