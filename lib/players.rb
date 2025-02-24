class Players
  def player_name
    loop do
      puts "Enter name of player who wants to play with X:"
      @player_x = gets.chomp.strip

      puts "Enter name of player who want to play with O:"
      @player_o = gets.chomp.strip

      break unless @player_x.empty? || @player_o.empty?

      puts "Invalid input! Please enter the valid name(s)."
    end
  end
end
