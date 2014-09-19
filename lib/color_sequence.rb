class ColorSequence
  attr_reader :colors                                             # => nil
  def initialize(colors=random)
    @colors = colors                                              # => "gybb"
  end
  def random(size=4)
    @colors = ''                                                  # => ""
    available_colors = ['r','g','b','y','w','b']                  # => ["r", "g", "b", "y", "w", "b"]
    size.times { @colors << available_colors[0..size-1].sample }  # => 4
    @colors                                                       # => "gybb"
  end
end
