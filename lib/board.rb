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

  def add_to_board(column)
    column = instance_variable_get("@#{column}")
    puts 'Column is already full.' unless column.include?(' ')

    insert_index = 0
    column.each_with_index do |item, index|
      insert_index = index
      break if item == ' '
    end
    column.insert(insert_index, 'X')
    column.pop
    column
  end

  def game_over?
    # vertical_comb? || horizontal_comb? || diagonal_comb? ? true : false
    vertical_comb? ? true : false
  end

  def vertical_comb?
    conditional = ->(item) { item == 'X' }
    columns = [@c1, @c2, @c3, @c4, @c5, @c6, @c7]
    columns.each do |column|
      return true if column[0...3].all?(conditional)
      return true if column[1...4].all?(conditional)
      return true if column[2...5].all?(conditional)
    end
    false
  end
end

# board = Board.new
# board.display
