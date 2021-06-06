require_relative "board.rb"
require_relative "player.rb"

class Game

    def initialize(player_1, player_2)
        @player_1 = Player.new(player_1)
        @player_2 = Player.new(player_2)
        @current_player = @player_1
        @board = Board.new
    end

    def swap_players
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    def play
        until @board.all_used?
            puts "Player: #{@current_player.mark};"
            @board.print
            @board.set_mark(@current_player.get_input, @current_player.mark)
            return "Player #{@current_player.mark} has won! Congrats!" if @board.win?(@current_player.mark)
            swap_players
        end
        "It's a draw!"
    end

end