class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1, @player_2, @board = player_1, player_2, board
  end
  def current_player
    player_1_moves = @board.cells.count {|cell| cell == @player_1.token}
    player_2_moves = @board.cells.count {|cell| cell == @player_2.token}
    player_1_moves > player_2_moves ? @player_2 : @player_1
  end
  def won?
    player_1_combinations = self.board.cells.each_with_index.select {|x, i| x == @player_1.token}.map(&:last).combination(3).to_a
    player_2_combinations = self.board.cells.each_with_index.select {|x, i| x == @player_2.token}.map(&:last).combination(3).to_a
    if WIN_COMBINATIONS.any? {|combination| player_1_combinations.include?(combination)}
      WIN_COMBINATIONS.find {|combination| player_1_combinations.include?(combination)}
    elsif WIN_COMBINATIONS.any? {|combination| player_2_combinations.include?(combination)}
      WIN_COMBINATIONS.find {|combination| player_2_combinations.include?(combination)}
    else
      false
    end
  end
  def draw?
    if self.board.full?
      self.won? ? false : true
    else
      false
    end
  end
  def over?
    (self.draw? || self.won?) ? true : false
  end
  def winner
    player_1_combinations = self.board.cells.each_with_index.select {|x, i| x == @player_1.token}.map(&:last).combination(3).to_a
    player_2_combinations = self.board.cells.each_with_index.select {|x, i| x == @player_2.token}.map(&:last).combination(3).to_a
    winning_combination = self.won?
    if player_1_combinations.include?(winning_combination)
      player_1.token
    elsif player_2_combinations.include?(winning_combination)
      player_2.token
    end
  end
  def turn
    while !board.valid_move?(input)
      input = gets.chomp
    end
  end
end
