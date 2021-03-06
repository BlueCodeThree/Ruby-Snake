# ----------------------------------------------------------------------
#                 RUBY SNAKE
# by Carlie Hamilton
# 14 April 2019
# Classic snake game in your terminal!
# -----------------------------------------------------------------------

require 'io/console'
require_relative 'classes/board'
require_relative 'classes/snake'
require_relative 'classes/apple'

FPS = 30

board = Board.new
snake = Snake.new
apple = Apple.new

apple.display(board)
while true
#    start = Time.now
    snake.display(board)
#    sleep(start + FPS - Time.now)
    case $stdin.getch
    when "a"
        snake.move_left(board, apple)
    when "e", "d"
        snake.move_right(board, apple)
    when ",", "w"
        snake.move_up(board, apple)
    when "o", "s"
        snake.move_down(board, apple)
    when "q"
        return
    else
        
    end
end
