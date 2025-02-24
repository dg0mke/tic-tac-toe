class Board
  def initialize
    @cells = Array.new(9, " ")
  end

  def valid_move?(position)
    position.between?(0, 8) && @cells[position] == " "
  end

  def make_move(position, sign)
    @cells[position] = sign if valid_move?(position)
  end

  def check_winner
    winning_combinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], # Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], # Columns
      [0, 4, 8], [2, 4, 6]             # Diagonals
    ]

    winning_combinations.each do |combo|
      if @cells[combo[0]] == @cells[combo[1]] && @cells[combo[1]] == @cells[combo[2]] && @cells[combo[0]] != " "
        return @cells[combo[0]]
      end
    end
    nil
  end

  def full?
    !@cells.include?(" ")
  end

  def show_board
    puts "#{@cells[0]} | #{@cells[1]} | #{@cells[2]}"
    puts "----------"
    puts "#{@cells[3]} | #{@cells[4]} | #{@cells[5]}"
    puts "----------"
    puts "#{@cells[6]} | #{@cells[7]} | #{@cells[8]}"
  end
end
