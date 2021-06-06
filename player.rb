class Player

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_input
        puts "Please input a row and a column seperated by spaces!"
        print ">"
        pos = gets.chomp.split.map(&:to_i)
        raise "Please input exactly two numbers!" if pos.length != 2
        pos
    end

end