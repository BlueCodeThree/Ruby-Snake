class Apple
    attr_reader :apple
    def initialize
        @apple = "🍎" #"\u1F34E".encode('utf-8')
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
            board.board[this_x][this_y] = @apple
        else
            display(board)
        end 
    end
end