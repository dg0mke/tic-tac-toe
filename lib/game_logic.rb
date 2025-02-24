require "colorize"
require_relative "board"
require_relative "players"

class GameLogic < Players
  def initialize
    super
    @board = Board.new
    player_name
    @current_player = @player_x
    @current_sign = "X".colorize(:red)
  end

  def change_turns
    if @current_player == @player_x
      @current_player = @player_o
      @current_sign = "O".colorize(:green)
    else
      @current_player = @player_x
      @current_sign = "X".colorize(:red)
    end
  end

  def play_game
    loop do
      @board.show_board
      puts "#{@current_player}, enter your move:"

      begin
        move = gets.chomp.split(",").map(&:to_i)
        raise ArgumentError if move.length != 2 || !move.all? { |n| n.between?(1, 3) }

        position = (move[0] - 1) * 3 + (move[1] - 1)

        if @board.valid_move?(position)
          @board.make_move(position, @current_sign)
        else
          puts "Invalid move! Try again."
          next
        end
      rescue NoMethodError, ArgumentError
        puts "Invalid input! Please enter row and column in proper format."
        next
      end

      winner = @board.check_winner
      if winner
        @board.show_board
        puts "#{@current_player} wins!"
        break
      elsif @board.full?
        @board.show_board
        puts "It's a draw!"
        break
      else
        change_turns
      end
    end
  end
end
