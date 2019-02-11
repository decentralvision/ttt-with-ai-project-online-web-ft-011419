require 'pry'
class Board
  attr_accessor :cells
  def initialize
    @cells = Array.new(9, ' ')
  end
  def reset!
    @cells = Array.new(9, ' ')
  end
  def display
    @cells
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  def position(input)
    @cells[input.to_i - 1]
  end
  def full?
    @cells.none?{|cell| cell == ' '}
  end
  def turn_count
    @cells.count {|cell| cell != ' '}
  end
  def taken?(cell)
    position(cell) != " " ? true : false
  end
  def valid_move?(cell)
    cell = cell.to_i
    !taken?(cell) && cell.between?(1,9) ? true : false
  end
  def update(cell, player)
    @cells[cell.to_i - 1] = player.token
  end
end
