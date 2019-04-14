class Snake
    attr_accessor :x, :y, :length, :snake
    def initialize
        @x = 10
        @y = 14
        @length = 1
        @snake = "\u229F".encode('utf-8')
        @body = "\u2584".encode('utf-8')
        @body_path = [[10, 14]]
        @body_x = @body_path[1][0]
        @body_y = @body_path[1][0]
        @body_start = 
        @body_end
    end

    def display(board)
        # @body = @body * @length
        # current_position = board.board[@x][@y]
        board.board[@x][@y] = @snake
        board.display
    end

    def move_left(board)
        # checks if there is a wall or body...
        if board.board[@x][@y-1] == "|"
            # You will be d-e-d dead.

        # if no wall, moves to the left
        elsif board.board[@x][@y-1] == " "
            board.board[@x][@y] = " "
            @y += -1   # change position of the snake head 
            @body_path.unshift([@x, @y])    # add new co-ordinates for the body to follow
    
            # getting the co-ordinates for the body

                body_x = @body_path[1][0]
                body_y = @body_path[1][1]
                board.board[body_x][body_y] = @body
                # board.board[body_x][body_y] = " "
                @body_path.pop
                p @body_path

            

        # what happens if it is an apple
        # plus in the score..., make snake length + 1
        end
    end

    def move_right(board)
        # checks if there is a wall
        if board.board[@x][@y+1] == "|"
            # you will DIEEEEEEEe

        # if no wall, moves to the right
        elsif board.board[@x][@y+1] == " "
            board.board[@x][@y] = " "
            @y += 1 

        # what happens if it is an apple
        # plus in the score...
        end
    end

    def move_up(board)
        # checks if there is a wall
        if board.board[@x-1][@y] == "-"
            # DIE

        # if no wall, moves up
        elsif board.board[@x-1][@y] == " "
            board.board[@x][@y] = " "
            @x += -1 

        # what happens if it is an apple
        # plus in the score...
        end
    end

    def move_down(board)
        # checks if there is a wall
        if board.board[@x+1][@y] == "-"
            # DIE!!!!!

        # if no wall, moves up
        elsif board.board[@x+1][@y] == " "
            board.board[@x][@y] = " "
            @x += 1 

        # what happens if it is an apple
        # plus in the score...
        end
    end
end