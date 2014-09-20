require_relative 'display'
require_relative 'compare'
require_relative 'color_sequence'
require_relative 'board'

class Game
  attr_reader :count, :input, :history, :board
  def initialize
    @count = 0
    @history = []
  end

  def play
    Display.start
    final_sequence = ColorSequence.new
    @board = Board.new
    board.show
    game_loop(final_sequence)
  end

  def collect_input

  end

  def instructions
    puts "How to play - TODO"
  end

  def play_round(final_sequence, guess)
    @count += 1
    result = Compare.guess(guess, final_sequence.colors)
    guess = Display.colorful(guess)
    @history << guess
    board.edit_row(count, @history)
    board.show
    Display.round_result(result, count, guess)
  end

  def game_loop(final_sequence)
    input = ''
    result = false
    while (count < 10) && (input != 'q')
      Display.enter_guess
      input = gets.chomp
      play_round(final_sequence, input)
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
