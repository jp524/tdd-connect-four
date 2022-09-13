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
    5.downto(0).to_a.each do |i|
      puts "#{@c1[i]}  | #{@c2[i]}  | #{@c3[i]}  | #{@c4[i]}  | #{@c5[i]}  | #{@c6[i]}  | #{@c7[i]}"
    end
    puts '-' * 32
    puts 'c1 | c2 | c3 | c4 | c5 | c6 | c7'
  end

  def add_to_board(column, marker)
    column = instance_variable_get("@#{column}")
    puts 'Column is already full.' unless column.include?(' ')

    insert_index = 0
    column.each_with_index do |item, index|
      insert_index = index
      break if item == ' '
    end
    column.insert(insert_index, marker)
    column.pop
    column
  end

  def game_over?(marker)
    vertical_comb?(marker) || horizontal_comb?(marker) || diagonal_comb?(marker) ? true : false
  end

  def vertical_comb?(marker)
    columns = [@c1, @c2, @c3, @c4, @c5, @c6, @c7]
    columns.each do |column|
      return true if column[0..3].all? { |item| item == marker }
      return true if column[1..4].all? { |item| item == marker }
      return true if column[2..5].all? { |item| item == marker }
    end
    false
  end

  def horizontal_comb?(marker)
    columns = [@c1, @c2, @c3, @c4, @c5, @c6, @c7]
    columns[0..3].each_index do |i|
      (0..5).each do |j|
        if columns[i][j] == marker && columns[i + 1][j] == marker && columns[i + 2][j] && columns[i + 3][j] == marker
          return true
        end
      end
    end
    false
  end

  def diagonal_comb?(marker)
    combinations = [[@c1[0], @c2[1], @c3[2], @c4[3]],
                    [@c1[1], @c2[2], @c3[3], @c4[4]],
                    [@c1[2], @c2[3], @c3[4], @c4[5]],

                    [@c2[0], @c3[1], @c4[2], @c5[3]],
                    [@c2[1], @c3[2], @c4[3], @c5[4]],
                    [@c2[2], @c3[3], @c4[4], @c5[5]],

                    [@c3[0], @c4[1], @c5[2], @c6[3]],
                    [@c3[1], @c4[2], @c5[3], @c6[4]],
                    [@c3[2], @c4[3], @c5[4], @c6[5]],

                    [@c4[0], @c5[1], @c6[2], @c7[3]],
                    [@c4[1], @c5[2], @c6[3], @c7[4]],
                    [@c4[2], @c5[3], @c6[4], @c7[5]],

                    [@c7[0], @c6[1], @c5[2], @c4[3]],
                    [@c7[1], @c6[2], @c5[3], @c4[4]],
                    [@c7[2], @c6[3], @c5[4], @c4[5]],

                    [@c6[0], @c5[1], @c4[2], @c3[3]],
                    [@c6[1], @c5[2], @c4[3], @c3[4]],
                    [@c6[2], @c5[3], @c4[4], @c3[5]],

                    [@c5[0], @c4[1], @c3[2], @c2[3]],
                    [@c5[1], @c4[2], @c3[3], @c2[4]],
                    [@c5[2], @c4[3], @c3[4], @c2[5]],

                    [@c4[0], @c3[1], @c2[2], @c1[3]],
                    [@c4[1], @c3[2], @c2[3], @c1[4]],
                    [@c4[2], @c3[3], @c2[4], @c1[5]]]
    combinations.each do |combination|
      return true if combination.all? { |item| item == marker }
    end
    false
  end
end

# board = Board.new
# # board.display
