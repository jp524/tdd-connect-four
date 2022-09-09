# frozen_string_literal: false

# Contains the game
class Game
  def verify_input(input)
    return input if input.match?(/c[1-7]/)
  end

  def player_turn
    loop do
      input = verify_input(player_input)
      break if input

      puts 'Invalid input.'
    end
  end

  private

  def player_input
    puts "Type in a column between \e[32m[c1]\e[0m and \e[32m[c7]\e[0m:"
    gets.chomp
  end
end
