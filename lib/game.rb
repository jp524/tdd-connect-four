# frozen_string_literal: false

require_relative './board'
require_relative './player'

# Contains the game
class Game
  def initialize
    @board = Board.new
    @player1 = Player.new('Player 1', 'X')
    @player2 = Player.new('Player 2', 'O')
    @player_list = { active: @player1, inactive: @player1 }
    @input = nil
  end

  def play_game
    introduction
    player_turn

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

    @board.add_to_board(@input, @player_list[:active].marker)
    @board.display
  end

  private

  def introduction
    puts 'Welcome to Connect Four!'
    @board.display
  end

  def player_input
    puts "#{@player_list[:active].name}: Type in a column between \e[32m[c1]\e[0m and \e[32m[c7]\e[0m:"
    gets.chomp
  end
end

game = Game.new
game.play_game
