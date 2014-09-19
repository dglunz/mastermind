require_relative 'display'         # => true
require_relative 'compare'         # => true
require_relative 'color_sequence'  # => true
require_relative 'board'

class Game
  attr_reader :count, :input, :history  # => nil
  def initialize
    @count = 0
    @history = []
  end

  def play
    Display.start
    final_sequence = ColorSequence.new
    board = Board.new(final_sequence)
    board.show
    game_loop(final_sequence)
  end

  def collect_input

  end

  def instructions
    puts "How to play - TODO"
  end

  def play_round(final_sequence)
    @count += 1
    Display.enter_guess
    input = gets.chomp
    result = Compare.guess(input, final_sequence.colors)
    @history << input
    Display.round_result(result, count)
  end

  def game_loop(final_sequence)
    input = ''
    result = false
    while (count <= 4) && (input != 'q') && (result != true)
      play_round(final_sequence)
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
