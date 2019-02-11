module Players
  class Human < Player
    def move(board)
      puts "please input a cell (1-9) to place your marker"
      gets.chomp
    end
  end
end
