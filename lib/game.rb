require_relative 'display'
require_relative 'compare'
require_relative 'color_sequence'
require_relative 'board'

class Game
  attr_reader :count, :history, :board, :win, :final

  def run
    Display.introduction
    start_menu
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
        else Display.input_invalid(input)
      end
    end
  end

  def play
    @win = false
    @history = []
    @count = 0
    Display.start
    final_sequence = ColorSequence.new
    @final = Display.colorful(final_sequence.colors)
    @board = Board.new
    board.show
    game_loop(final_sequence)
  end

  def game_loop(final_sequence)
    input = ''
    while (count < 10) && (input != 'q') && (win != true)
      Display.enter_guess
      input = gets.chomp
      valid_input?(input) ? play_round(final_sequence, input) : invalid_input(input)
    end
    win ? finished : lose
  end

  def play_round(final_sequence, guess)
    @count += 1
    result = Compare.guess(guess, final_sequence.colors)
    guess = Display.colorful(guess)
    @history << guess
    Display.mastermind
    board.edit_row(count, @history)
    board.show
    result[:positions] == 4 ? winner : Display.round_result(result, count, guess)
  end

  def collect_input

  end

  def instructions
    Display.instructions
  end

  def valid_input?(input)
    (input.length == 4) && (input.scan(/[^rgby]/).length == 0) # && input only includes rgby
  end

  def invalid_input(input)
    input == 'q' || input == 'quit' ? return : Display.invalid_input(input)
  end

  def finished
    Display.mastermind
    board.finished(count, history, final)
    board.show
    win ? Display.winner : Display.lose
    play_again? ? play : exit
  end

  def winner
    @win = true
  end

  def lose
    finished
  end

  def play_again?
    puts "Play Again? (Y)es or (N)o"
    Display.enter
    input = gets.chomp.downcase
    input == 'y' || input == 'yes' ? true : false
  end

end
