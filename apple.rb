class Apple
    attr_reader :apple, :current_food
    def initialize
        @apple = ["🍕", "🍎", "🧀", "🥕", "🌶️", "🥦", "🍗", "🍟", "🍔", "🌮", "🍙", "🍜", "🍷", "🍺"] # it is no longer an apple... 
        @copy = @apple
        @current_food = 0
    end

    def random_x
        rand(1..20)
    end

    def random_y
        rand(1..29)
    end

    def display(board)
        # checks first that the space is == " "
        this_x = random_x
        this_y = random_y
        if board.board[this_x][this_y] == " "
            board.board[this_x][this_y] = random_food
            if @copy.length == 1
                @copy = @apple
            end
        else
            display(board)
            p @copy
        end 
    end

    def random_food
        # get a random food
        @current_food = @copy.shuffle.pop
    end
end