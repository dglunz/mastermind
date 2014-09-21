require_relative 'display'
require_relative 'color_sequence'
require_relative 'board'

class Game
  attr_reader :round, :history, :board

  def initialize
    @history = []
    @round = 0
    @final_sequence = ColorSequence.new
    @pretty_final_sequence = Display.colorful(@final_sequence.colors)
    @board = Board.new
    @guess = ''
    @finished = false
  end

  def start
    board.show
    game_loop
  end

  def game_loop
    while (round < 10) && (@guess != 'q')
      get_input
      if valid_input?(@guess)
        round_result = play_round(@guess)
        if round_result[:positions] == 4
          break
        else
          show_round_result(round_result)
        end
      else
        invalid_input(@guess)
      end
    end
    finished
  end

  def show_round_result(round_result)
    Display.round_result(round_result, round)
  end

  def get_input
    Display.enter_guess
    @guess = gets.chomp.downcase
  end

  def play_round(guess)
    @round += 1
    result = @final_sequence.guess(guess)
    @history << Display.colorful(guess)
    update_board
    result
  end

  def update_board
    Display.mastermind
    @finished ? finish_board : edit_board
    board.show
  end

  def finish_board
    board.finished(round, history, @pretty_final_sequence)
  end

  def edit_board
    board.edit_row(round, @history)
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
    @finished = true
    update_board
    # win ? Display.winner : Display.lose
  end

end
