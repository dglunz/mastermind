require 'terminal-table'

class Board
  attr_accessor :table
  def initialize(size=4)
    @rows = []
    @title = "Mastermind"
    @header = ['Turn', "Guess", ""]
    @rows << ['Final', "????", " "]
    10.downto(1) { |x| @rows << [x, "    ", " "] }
    create_new_table
  end

  def edit_row(round, history)
    @rows = []
    fill_existing_table(history)
    create_new_table
  end

  def finished(round, history, final)
    @rows = []
    @title = "Game Over"
    @rows << ['Final', final , " "]
    fill_existing_table(history)
    create_new_table
  end

  def fill_existing_table(history)
    10.downto(history.length+1) { |x| @rows << [x, "    ", " "] }
    history.reverse.each_with_index { |round, index| @rows << [history.length - index, round, " "] }
  end

  def create_new_table
    table = Terminal::Table.new :title => @title, :headings => @header, :rows => @rows
    @table = table
  end

  def show
    puts table
  end
end
