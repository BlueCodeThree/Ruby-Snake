class Snake
    attr_accessor :x, :y, :length, :snake
    def initialize
        @x = 10
        @y = 14
        @length = 2
        @snake = "😀" #"\u229F".encode('utf-8')
        @body = "⏹️" # "\u2584".encode('utf-8')
        @body_path = [[10, 14], [10, 14], [10, 15]]

    end

    def display(board)
        board.board[@x][@y] = @snake
        board.display
    end

    def move_left(board, apple)
        left = board.board[@x][@y-1]
        # checks if there is a wall or body...
        if left == "|"
            # You will be d-e-d dead.

        # if no wall, moves to the left
        elsif left == " "
            board.board[@x][@y] = " "
            @y += -1   # change position of the snake head 
            unshift
    
            # getting the co-ordinates for the body
            print_body(board)
            
            # end of the body
            body_end(board)

        # what happens if it is an apple
        elsif left == apple.current_food
        board.plus_score    # plus in the score
        increase_length     # make snake longer
        @y += -1    # change the snake head position
        unshift
        print_body(board)
        apple.display(board) # change the location of the apple
        end
    end

    def move_right(board, apple)
        right = board.board[@x][@y+1]
        # checks if there is a wall
        if right == "|"
            # you will DIEEEEEEEe

        # if no wall, moves to the right
        elsif right == " "
            board.board[@x][@y] = " "
            @y += 1 
            unshift
            print_body(board)
            body_end(board)

        # what happens if it is an apple
        elsif right == apple.current_food
            board.plus_score
            increase_length
            @y += 1 # change the snake head position
            unshift
            print_body(board)
            apple.display(board) # change the location of the apple
        end
    end

    def move_up(board, apple)
        up = board.board[@x-1][@y]
        # checks if there is a wall
        if up == "-"
            # DIE

        # if no wall, moves up
        elsif up == " "
            board.board[@x][@y] = " "
            @x += -1 
            unshift
            print_body(board)
            body_end(board)

        # what happens if it is an apple
        elsif up == apple.current_food
            board.plus_score
            increase_length
            @x += -1 # change the snake head position
            unshift
            print_body(board)
            apple.display(board) # change the location of the apple
        end
    end

    def move_down(board, apple)
        down = board.board[@x+1][@y]
        # checks if there is a wall
        if down == "-"
            # DIE!!!!!

        # if no wall, moves up
        elsif down == " "
            board.board[@x][@y] = " "
            @x += 1 
            unshift
            print_body(board)
            body_end(board)

        # what happens if it is an apple
        elsif down == apple.current_food
            @x += 1 # change the snake head position
            get_apple(board, apple)
        end
    end

    # adds new co-ordinates for the body to follow
    def unshift
        @body_path.unshift([@x, @y])
    end

    # puts the trailing body to the screen
    def print_body(board)
        body_x = @body_path[1][0]
        body_y = @body_path[1][1]
        board.board[body_x][body_y] = @body
    end

    # ends the trailing body. Gets the last co-ordinates and turns it back into a blank board. Gets rid of the last co-ordinates from the body path.
    def body_end(board)
        body_end_x = @body_path[1 + @length][0]
        body_end_y = @body_path[1 + @length][1]
        board.board[body_end_x][body_end_y] = " "
        @body_path.pop
    end

    def increase_length
        @length += 1
    end

    def get_apple(board, apple)
        board.plus_score
        increase_length
        unshift
        print_body(board)
        apple.display(board) # change the location of the apple
    end
end