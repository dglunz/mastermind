require 'terminal-table'

class Board
  attr_reader :table
  def initialize(size=4, final)
    rows = []
    rows << ['', "????"]
    11.downto(1) { |x| rows << [x-1, "    "] }
    table = Terminal::Table.new :rows => rows
    @table = table
  end

  def show
    puts table
  end
end
