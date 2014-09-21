require 'terminal-table'

class Board
  attr_accessor :table
  def initialize(size=4)
    rows = []
    title = "Mastermind"
    header = ['Turn', "Guess", ""]
    rows << ['Final', "????", " "]
    10.downto(1) { |x| rows << [x, "    ", " "] }
    table = Terminal::Table.new :title => title, :headings => header, :rows => rows
    @table = table
  end

  def edit_row(round, history)
    rows = []
    title = "Mastermind"
    header = ['Turn', "Guess", ""]
    rows << ['Final', "????", " "]
    10.downto(history.length+1) { |x| rows << [x, "    ", " "] }
    history.reverse.each_with_index { |round, index| rows << [history.length - index, round, " "] }
    table = Terminal::Table.new :title => title, :headings => header, :rows => rows
    @table = table
  end

  def finished(round, history, final)
    rows = []
    title = "Game Over"
    header = ['Turn', "Guess", ""]
    rows << ['Final', final , " "]
    10.downto(history.length+1) { |x| rows << [x, "    ", " "] }
    history.reverse.each_with_index { |round, index| rows << [history.length - index, round, " "] }
    table = Terminal::Table.new :title => title, :headings => header, :rows => rows
    @table = table
  end

  def show
    puts table
  end
end

# gameboard = Board.new
# gameboard.show
# gameboard.table.rows[1].cells[1].value
# gameboard.table.rows.each {|x| puts x.cells}
# gameboard.edit_row(1, "rrbr")
# gameboard.show
