module SelfLogic
    cattr_accessor :exclude_self

    def self.findSelf(board)

        @@exclude_self = []
        
        # should prob make this it's own class later
        mySnake = board[:you]
        myHead = mySnake[:head]
        myHeadX = myHead[:x]
        myHeadY = myHead[:y]
        myBody = mySnake[:body]

    end

    def FindSelf
        
    end
end