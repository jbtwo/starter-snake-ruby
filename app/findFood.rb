module FoodLogic
  def self.findFood(my_snake, possible_moves, food)
    closest_food = {}
    closest_distance = nil
    food_x_dir = nil
    food_y_dir = nil

    # loop through food
    food.each_with_index do |food, index|
      x_distance = my_snake.head[:x] - food[:x]

      y_distance = my_snake.head[:y] - food[:y]

      total_distance = (x_distance).abs + (y_distance).abs

      if index == 0
        closest_food = food
        closest_distance = total_distance
      elsif total_distance < closest_distance
        closest_food = food
        closest_distance = total_distance
      end
    end

    # find direction of food
    food_x_dir =
      if closest_food[:x] < my_snake.head[:x]
        'left'
      elsif closest_food[:x] > my_snake.head[:x]
        'right'
      else
        nil
      end

    food_y_dir =
      if closest_food[:y] < my_snake.head[:y]
        'down'
      elsif closest_food[:x] > my_snake.head[:x]
        'up'
      else
        nil
      end

    closest_food_dirs = [food_x_dir, food_y_dir]
  end
end
