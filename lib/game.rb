require_relative 'display'
require_relative 'compare'
require_relative 'color_sequence'

class Game
  attr_reader :count, :input
  def initialize
    @count = 0
  end

  def play
    Display.start
    final_sequence = ColorSequence.new("rgby") #randomly pick
    game_loop(final_sequence)
  end

  def instructions
    puts "How to play - TODO"
  end

  def play_round
    @count += 1
    Display.enter_guess
    input = gets.chomp
    result = Compare.guess(input, final_sequence.colors)
    Display.round_result(input, 2, 3, count)  
  end

  def game_loop(final_sequence)
    input = ''
    result = false
    while (count <= 4) && (input != 'q') && (result != true)
      play_round
    end
    play_again?
  end

  def finished
    Display.results
    Display.enter
    play_again? ? play : return
  end

  def play_again?
    puts "Play Again?"
    false
  end

  def start_menu
    input = ''
    while input != 'q'
      Display.enter
      input = gets.chomp
      case input
      when 'p' || 'play' then play
      when 'i' || 'instructions' then instructions
      when 'q' || 'quit' then Display.quit
      else puts "#{input} is not valid."
      end

    end
  end

  def run
    Display.introduction
    start_menu
  end

end
