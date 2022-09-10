# frozen_string_literal: false

require_relative './board'
require_relative './player'

# Contains the game
class Game
  def initialize
    @board = Board.new
    @player1 = Player.new('Player 1', 'X')
    @player2 = Player.new('Player 2', 'O')
    @input = nil
  end

  def verify_input(input)
    return input if input.match?(/c[1-7]/)
  end

  def player_turn
    loop do
      @input = verify_input(player_input)
      break if @input

      puts 'Invalid input.'
    end

    @board.add_to_board(@input)
  end

  private

  def player_input
    puts "Type in a column between \e[32m[c1]\e[0m and \e[32m[c7]\e[0m:"
    gets.chomp
  end
end
