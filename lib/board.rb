# frozen_string_literal: false

# Contains and displays the 7x6 game board
class Board
  def initialize
    @c1 = Array.new(6) { ' ' }
    @c2 = Array.new(6) { ' ' }
    @c3 = Array.new(6) { ' ' }
    @c4 = Array.new(6) { ' ' }
    @c5 = Array.new(6) { ' ' }
    @c6 = Array.new(6) { ' ' }
    @c7 = Array.new(6) { ' ' }
  end

  def display
    (0...6).each do |i|
      puts "#{@c1[i]}  | #{@c2[i]}  | #{@c3[i]}  | #{@c4[i]}  | #{@c5[i]}  | #{@c6[i]}  | #{@c7[i]}"
    end
    puts '-' * 32
    puts 'c1 | c2 | c3 | c4 | c5 | c6 | c7'
  end
end

board = Board.new
board.display
