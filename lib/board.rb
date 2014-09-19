require 'terminal-table'

class Board
  attr_reader :table
  def initialize(size=4, final)
    rows = []
    rows << ['One', 1]
    rows << ['Two', 2]
    rows << ['Three', 3]
    table = Terminal::Table.new :rows => rows
    @table = table
  end

  def show
    puts table
  end
end
