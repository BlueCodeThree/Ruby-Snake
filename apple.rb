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
        # check first that the space is == " "
        board.board[random_x][random_y] = @apple
    end
end