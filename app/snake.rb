class Snake
  attr_accessor :id, :name, :health, :body, :head, :length

  def initialize(snake)
    @id = snake[:id]
    @name = snake[:name]
    @health = snake[:health]
    @body = snake[:body]
    @head = snake[:head]
    @length = snake[:length]
  end
end
